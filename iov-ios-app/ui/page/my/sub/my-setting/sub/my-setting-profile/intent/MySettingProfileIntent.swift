//
//  ProfileIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class MySettingProfileIntent: MviIntentProtocol {
    
    // MARK: Model
    
    private weak var modelAction: MySettingProfileModelActionProtocol?
    private weak var modelRouter: MySettingProfileModelRouterProtocol?
    @AppStorage("userNickname") private var userNickname: String = ""
    @AppStorage("userAvatar") private var userAvatar: String = ""
    
    init(model: MySettingProfileModelActionProtocol & MySettingProfileModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    /// 页面出现
    func viewOnAppear() {
        modelAction?.displayLoading()
        TspApi.getAccountInfo() { (result: Result<TspResponse<AccountInfo>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    self.modelAction?.updateProfile(account: response.data!)
                } else {
                    self.modelAction?.displayError(text: response.message ?? "异常")
                }
            case let .failure(error):
                print(error)
                self.modelAction?.displayError(text: "请求异常")
            }
        }
    }
    
    /// 点击登录
    func onTapLogin() {
        modelRouter?.routeToLogin()
    }
    
}

// MARK: Public

extension MySettingProfileIntent: MySettingProfileIntentProtocol {
    
    func onSelectAvatar(image: UIImage) {
        modelAction?.displayLoading()
        TspApi.generateAvatarUrl() { (result: Result<TspResponse<PreSignedUrl>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    let uploadUrl = response.data!.uploadUrl
                    let objectKey = response.data!.objectKey
                    TspApi.uploadCos(url: uploadUrl, image: image, objectKey: objectKey) { (result: Result<String, Error>) in
                        switch result {
                        case .success(_):
                            let index = uploadUrl.firstIndex(of: "?")!
                            let position = uploadUrl.distance(from: uploadUrl.startIndex, to: index)
                            let imageUrl = uploadUrl.prefix(position)
                            TspApi.modifyAvatar(imageUrl: String(imageUrl)) { (result: Result<TspResponse<NoReply>, Error>) in
                                switch result {
                                case .success(let response):
                                    if(response.code == 0) {
                                        self.userAvatar = String(imageUrl)
                                        self.modelAction?.updateAvatar(imageUrl: String(imageUrl))
                                    } else {
                                        self.modelAction?.displayError(text: response.message ?? "异常")
                                    }
                                case let .failure(error):
                                    print(error)
                                    self.modelAction?.displayError(text: "请求异常")
                                }
                            }
                        case let .failure(error):
                            print(error)
                            self.modelAction?.displayError(text: "请求异常")
                        }
                        
                    }
                } else {
                    self.modelAction?.displayError(text: response.message ?? "异常")
                }
            case let .failure(error):
                print(error)
                self.modelAction?.displayError(text: "请求异常")
            }
        }
    }
    func onTapNickname() {
        modelRouter?.routeToNickname()
    }
    func onTapGender() {
        modelRouter?.routeToGender()
    }
    func onTapBirthdaySaveButton(date: Date) {
        modelAction?.displayLoading()
        TspApi.modifyBirthday(birthday: dateToStr(date: date)) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    TspApi.getAccountInfo() { (result: Result<TspResponse<AccountInfo>, Error>) in
                        switch result {
                        case .success(let response):
                            if(response.code == 0) {
                                self.modelAction?.updateProfile(account: response.data!)
                            } else {
                                self.modelAction?.displayError(text: response.message ?? "异常")
                            }
                        case let .failure(error):
                            print(error)
                            self.modelAction?.displayError(text: "请求异常")
                        }
                    }
                } else {
                    self.modelAction?.displayError(text: response.message ?? "异常")
                }
            case let .failure(error):
                print(error)
                self.modelAction?.displayError(text: "请求异常")
            }
        }
    }
    func onTapArea() {
        modelRouter?.routeToArea()
    }
    func onTapBackSetting() {
        modelRouter?.closeScreen()
    }
}

// MARK: - Helper classes

extension MySettingProfileTypes.Intent {
    struct ExternalData {}
}
