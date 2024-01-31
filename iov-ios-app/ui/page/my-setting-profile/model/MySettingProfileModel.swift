//
//  ProfileModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class MySettingProfileModel: ObservableObject, MySettingProfileModelStateProtocol {
    @Published var contentState: MySettingProfileTypes.Model.ContentState = .content
    let loadingText = "Loading"
    var avatar: String = ""
    var nickname: String = ""
    var gender: String = "UNKNOWN"
    let routerSubject = MySettingProfileRouter.Subjects()
}

// MARK: - Action Protocol

extension MySettingProfileModel: MySettingProfileModelActionProtocol {
    func displayLoading() {
        contentState = .loading
    }
    func displayProfile() {
        contentState = .content
    }
    func updateProfile(account: AccountInfo) {
        self.avatar = account.avatar ?? ""
        self.nickname = account.nickname
        self.gender = account.gender
        contentState = .content
    }
    func updateAvatar(imageUrl: String) {
        self.avatar = imageUrl
        contentState = .content
    }
    func displayError(text: String) {
        contentState = .error(text: text)
    }
}

// MARK: - Route Protocol

extension MySettingProfileModel: MySettingProfileModelRouterProtocol {
    func closeScreen() {
        routerSubject.close.send()
    }
    func routeToLogin() {
        
    }
    func routeToNickname() {
        routerSubject.screen.send(.nickname)
    }
    func routeToGender() {
        routerSubject.screen.send(.gender)
    }
}

extension MySettingProfileTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
