//
//  MySettingProfileNicknameIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

class MySettingProfileGenderIntent: MviIntentProtocol {
    private weak var modelAction: MySettingProfileGenderModelActionProtocol?
    private weak var modelRouter: MySettingProfileGenderModelRouterProtocol?
    
    init(model: MySettingProfileGenderModelActionProtocol & MySettingProfileGenderModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    func viewOnAppear() {
        modelAction?.displayLoading()
        TspApi.getAccountInfo() { (result: Result<TspResponse<AccountInfo>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    self.modelAction?.updateGender(gender: response.data?.gender ?? "")
                } else {
                    self.modelAction?.displayError(text: response.message ?? "异常")
                }
            case let .failure(error):
                print(error)
                self.modelAction?.displayError(text: "请求异常")
            }
        }
    }
}

// MARK: Public

extension MySettingProfileGenderIntent: MySettingProfileGenderIntentProtocol {
    
    func onTapBackProfile() {
        modelRouter?.closeScreen()
    }
    func onTapGenderSaveButton(gender: String) {
        modelAction?.displayLoading()
        TspApi.modifyGender(gender: gender) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    self.modelRouter?.closeScreen()
                } else {
                    self.modelAction?.displayError(text: response.message ?? "异常")
                }
            case let .failure(error):
                print(error)
                self.modelAction?.displayError(text: "请求异常")
            }
        }
    }
}

// MARK: - Helper classes

extension MySettingProfileGenderTypes.Intent {
    struct ExternalData {}
}
