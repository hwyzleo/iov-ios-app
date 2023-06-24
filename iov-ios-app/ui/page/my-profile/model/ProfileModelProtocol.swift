//
//  ProfileModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol ProfileModelStateProtocol {
    var contentState: ProfileTypes.Model.ContentState { get }
    var loadingText: String { get }
    var avatar: String { get }
    var nickname: String { get }
    var gender: String { get }
    var routerSubject: ProfileRouter.Subjects { get }
}

// MARK: - Intent Action

protocol ProfileModelActionProtocol: AnyObject {
    func displayLoading()
    func displayProfile()
    func updateProfile(account: AccountInfo)
    func updateAvatar(imageUrl: String)
    func displayNickname()
    func updateNickname(nickname: String)
    func displayGender()
    func updateGender(gender: String)
    func displayError(text: String)
}

// MARK: - Route

protocol ProfileModelRouterProtocol: AnyObject {
    func closeScreen()
}
