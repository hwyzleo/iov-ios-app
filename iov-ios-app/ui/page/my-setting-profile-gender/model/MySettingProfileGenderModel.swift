//
//  MySettingProfileNicknameModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

final class MySettingProfileGenderModel: ObservableObject, MySettingProfileGenderModelStateProtocol {
    @Published var contentState: MySettingProfileGenderTypes.Model.ContentState = .content
    let loadingText = "Loading"
    let routerSubject = MySettingProfileGenderRouter.Subjects()
    var gender: String = ""
}

// MARK: - Action Protocol

extension MySettingProfileGenderModel: MySettingProfileGenderModelActionProtocol {
    func displayLoading() {
        contentState = .loading
    }
    func updateGender(gender: String) {
        self.gender = gender
        contentState = .content
    }
    func displayError(text: String) {
        contentState = .error(text: text)
    }
}

// MARK: - Route Protocol

extension MySettingProfileGenderModel: MySettingProfileGenderModelRouterProtocol {
    func routeToLogin() {}
    func closeScreen() {
        routerSubject.close.send()
    }
}

extension MySettingProfileGenderTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
