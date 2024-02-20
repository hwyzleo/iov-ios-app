//
//  MySettingProfileNicknameModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

final class MySettingProfileNicknameModel: ObservableObject, MySettingProfileNicknameModelStateProtocol {
    @Published var contentState: MySettingProfileNicknameTypes.Model.ContentState = .content
    let loadingText = "Loading"
    let routerSubject = MySettingProfileNicknameRouter.Subjects()
    var nickname = ""
}

// MARK: - Action Protocol

extension MySettingProfileNicknameModel: MySettingProfileNicknameModelActionProtocol {
    func displayLoading() {}
    func displayError(text: String) {
        contentState = .error(text: text)
    }
}

// MARK: - Route Protocol

extension MySettingProfileNicknameModel: MySettingProfileNicknameModelRouterProtocol {
    func routeToLogin() {}
    func closeScreen() {
        routerSubject.close.send()
    }
    func routeToProfile() {
        routerSubject.screen.send(.profile)
    }
}

extension MySettingProfileNicknameTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
