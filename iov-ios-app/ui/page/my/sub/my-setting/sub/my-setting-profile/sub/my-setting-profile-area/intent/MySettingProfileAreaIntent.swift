//
//  MySettingProfileNicknameIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

class MySettingProfileAreaIntent: MviIntentProtocol {
    
    // MARK: Model
    
    private weak var modelAction: MySettingProfileAreaModelActionProtocol?
    private weak var modelRouter: MySettingProfileAreaModelRouterProtocol?
    
    init(model: MySettingProfileAreaModelActionProtocol & MySettingProfileAreaModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    func viewOnAppear() {
        
    }
    func onTapLogin() {
        modelRouter?.routeToLogin()
    }
    
}

// MARK: Public

extension MySettingProfileAreaIntent: MySettingProfileAreaIntentProtocol {
    
    func onTapBackProfile() {
        modelRouter?.closeScreen()
    }
    func onTapProvince(province: String) {
        modelAction?.selectProvince(province: province)
    }
    func onTapBackProvince() {
        modelAction?.backProvince()
    }
    func onTapCity(city: String) {
        modelAction?.displayLoading()
        TspApi.modifyArea(area: city) { (result: Result<TspResponse<NoReply>, Error>) in
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

extension MySettingProfileAreaTypes.Intent {
    struct ExternalData {}
}
