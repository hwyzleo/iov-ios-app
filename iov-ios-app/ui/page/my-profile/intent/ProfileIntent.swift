//
//  ProfileIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class ProfileIntent: MviIntentProtocol {
    
    // MARK: Model
    
    private weak var modelAction: ProfileModelActionProtocol?
    private weak var modelRouter: ProfileModelRouterProtocol?
    @AppStorage("userNickname") private var userNickname: String = ""
    @AppStorage("userAvatar") private var userAvatar: String = ""
    
    init(model: ProfileModelActionProtocol & ProfileModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    /// 页面出现
    func viewOnAppear() {
        modelAction?.displayLoading()
        TspApi.getAccountInfo() { (result: Result<TspResponse<AccountInfo>, Error>) in
            switch result {
            case .success(let response):
                self.modelAction?.updateProfile(account: response.data!)
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

extension ProfileIntent: ProfileIntentProtocol {
    
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
    func onTapBackProfile() {
        modelAction?.displayProfile()
    }
    func onTapNickname() {
        modelAction?.displayNickname()
    }
    func onTapNicknameSaveButton(nickname: String) {
        modelAction?.displayLoading()
        TspApi.modifyNickname(nickname: nickname) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    self.userNickname = nickname
                    self.modelAction?.updateNickname(nickname: nickname)
                } else {
                    self.modelAction?.displayError(text: response.message ?? "异常")
                }
            case let .failure(error):
                print(error)
                self.modelAction?.displayError(text: "请求异常")
            }
        }
    }
    func onTapGender() {
        modelAction?.displayGender()
    }
    func modifyGender(gender: String) {
        modelAction?.displayLoading()
        TspApi.modifyGender(gender: gender) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    self.modelAction?.updateGender(gender: gender)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}

// MARK: - Helper classes

extension ProfileTypes.Intent {
    struct ExternalData {}
}
