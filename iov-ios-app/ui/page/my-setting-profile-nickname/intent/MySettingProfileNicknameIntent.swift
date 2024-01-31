//
//  MySettingProfileNicknameIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

class MySettingProfileNicknameIntent: MviIntentProtocol {
    
    // MARK: Model
    
    private weak var modelAction: MySettingProfileNicknameModelActionProtocol?
    private weak var modelRouter: MySettingProfileNicknameModelRouterProtocol?
    
    init(model: MySettingProfileNicknameModelActionProtocol & MySettingProfileNicknameModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    func viewOnAppear() {}
    func onTapLogin() {
        modelRouter?.routeToLogin()
    }
    
}

// MARK: Public

extension MySettingProfileNicknameIntent: MySettingProfileNicknameIntentProtocol {
    
    func onTapBackProfile() {
        modelRouter?.closeScreen()
    }
    func onTapNicknameSaveButton(nickname: String) {
        modelAction?.displayLoading()
        TspApi.modifyNickname(nickname: nickname) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                if(response.code != 0) {
                    self.modelAction?.displayError(text: response.message ?? "异常")
                } else {
                    User.modifyNickname(nickname: nickname)
                    self.modelRouter?.closeScreen()
                }
            case let .failure(error):
                print(error)
                self.modelAction?.displayError(text: "请求异常")
            }
        }
    }
}

// MARK: - Helper classes

extension MySettingProfileNicknameTypes.Intent {
    struct ExternalData {}
}
