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
}

extension ProfileModel: ProfileModelActionProtocol {
    func displayLoading() {
        contentState = .loading
    }
    func update(account: AccountInfo) {
        self.avatar = account.avatar ?? ""
        self.nickname = account.nickname
        self.gender = account.gender
        contentState = .content
    }
    func enterNickname() {
        contentState = .nickname
    }
    func updateNickname(nickname: String) {
        self.nickname = nickname
        contentState = .content
    }
    func enterGender() {
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


extension ProfileTypes.Model {
    enum ContentState {
        case loading
        case content
        case nickname
        case gender
        case error(text: String)
    }
}
