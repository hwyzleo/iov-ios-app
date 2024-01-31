//
//  ProfileModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol MySettingProfileModelStateProtocol {
    var contentState: MySettingProfileTypes.Model.ContentState { get }
    var loadingText: String { get }
    var avatar: String { get }
    var nickname: String { get }
    var gender: String { get }
    var routerSubject: MySettingProfileRouter.Subjects { get }
}

// MARK: - Intent Action

protocol MySettingProfileModelActionProtocol: MviModelActionProtocol {
    func displayLoading()
    func displayProfile()
    func updateProfile(account: AccountInfo)
    func updateAvatar(imageUrl: String)
    func displayError(text: String)
}

// MARK: - Route

protocol MySettingProfileModelRouterProtocol: MviModelRouterProtocol {
    /// 关闭当前页
    func closeScreen()
    /// 路由至昵称页面
    func routeToNickname()
    /// 路由至性别页面
    func routeToGender()
}
