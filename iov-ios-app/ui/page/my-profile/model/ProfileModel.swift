//
//  ProfileModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class ProfileModel: ObservableObject, MviModel, ProfileModelStateProtocol {
    @Published var contentState: ProfileTypes.Model.ContentState = .content
    let loadingText = "Loading"
    var avatar: String = ""
    var nickname: String = ""
    var gender: String = "UNKNOWN"
    let routerSubject = ProfileRouter.Subjects()
}

// MARK: - Action Protocol

extension ProfileModel: ProfileModelActionProtocol {
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
    func displayNickname() {
        contentState = .nickname
    }
    func updateNickname(nickname: String) {
        self.nickname = nickname
        contentState = .content
    }
    func displayGender() {
        contentState = .gender
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

extension ProfileModel: ProfileModelRouterProtocol {
    func closeScreen() {
        routerSubject.close.send()
    }
}

extension ProfileTypes.Model {
    enum ContentState {
        case loading
        case content
        case nickname
        case gender
        case error(text: String)
    }
}
