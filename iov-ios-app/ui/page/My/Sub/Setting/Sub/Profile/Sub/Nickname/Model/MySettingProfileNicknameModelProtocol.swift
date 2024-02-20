//
//  MySettingProfileNicknameModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

// MARK: - View State

protocol MySettingProfileNicknameModelStateProtocol {
    var contentState: MySettingProfileNicknameTypes.Model.ContentState { get }
    var loadingText: String { get }
    var routerSubject: MySettingProfileNicknameRouter.Subjects { get }
    var nickname: String { get }
}

// MARK: - Intent Action

protocol MySettingProfileNicknameModelActionProtocol: MviModelActionProtocol {
    func displayError(text: String)
}

// MARK: - Route

protocol MySettingProfileNicknameModelRouterProtocol: MviModelRouterProtocol {
    /// 跳转至个人简介页
    func routeToProfile()
}
