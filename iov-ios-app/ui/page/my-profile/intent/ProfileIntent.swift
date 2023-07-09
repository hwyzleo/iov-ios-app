//
//  ProfileIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class ProfileIntent: MviIntent {
    
    // MARK: Model
    
    private weak var model: ProfileModelActionProtocol?
    private weak var routeModel: ProfileModelRouterProtocol?
    @AppStorage("userNickname") private var userNickname: String = ""
    @AppStorage("userAvatar") private var userAvatar: String = ""
    
    init(model: ProfileModelActionProtocol & ProfileModelRouterProtocol) {
        self.model = model
        self.routeModel = model
    }
    
}

// MARK: Public

extension ProfileIntent: ProfileIntentProtocol {
    func viewOnAppear() {
        model?.displayLoading()
        TspApi.getAccountInfo() { (result: Result<TspResponse<AccountInfo>, Error>) in
            switch result {
            case .success(let response):
                self.model?.updateProfile(account: response.data!)
            case let .failure(error):
                print(error)
                self.model?.displayError(text: "请求异常")
            }
        }
    }
    func onSelectAvatar(image: UIImage) {
        model?.displayLoading()
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
                                        self.model?.updateAvatar(imageUrl: String(imageUrl))
                                    } else {
                                        self.model?.displayError(text: response.message ?? "异常")
                                    }
                                case let .failure(error):
                                    print(error)
                                    self.model?.displayError(text: "请求异常")
                                }
                            }
                        case let .failure(error):
                            print(error)
                            self.model?.displayError(text: "请求异常")
                        }
                        
                    }
                } else {
                    self.model?.displayError(text: response.message ?? "异常")
                }
            case let .failure(error):
                print(error)
                self.model?.displayError(text: "请求异常")
            }
        }
    }
    func onTapBackProfile() {
        model?.displayProfile()
    }
    func onTapNickname() {
        model?.displayNickname()
    }
    func onTapNicknameSaveButton(nickname: String) {
        model?.displayLoading()
        TspApi.modifyNickname(nickname: nickname) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    self.userNickname = nickname
                    self.model?.updateNickname(nickname: nickname)
                } else {
                    self.model?.displayError(text: response.message ?? "异常")
                }
            case let .failure(error):
                print(error)
                self.model?.displayError(text: "请求异常")
            }
        }
    }
    func onTapGender() {
        model?.displayGender()
    }
    func modifyGender(gender: String) {
        model?.displayLoading()
        TspApi.modifyGender(gender: gender) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    self.model?.updateGender(gender: gender)
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
