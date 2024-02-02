//
//  MySettingModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import Foundation

// MARK: - View State

protocol MySettingModelStateProtocol {
    var contentState: MySettingTypes.Model.ContentState { get }
    var routerSubject: MySettingRouter.Subjects { get }
}

// MARK: - Intent Action

protocol MySettingModelActionProtocol: MviModelActionProtocol {
    /// 用户登出
    func logout()
}

// MARK: - Route

protocol MySettingModelRouterProtocol: MviModelRouterProtocol {
    /// 跳转至个人资料
    func routeToProfile()
    /// 跳转至我的
    func routeToMy()
}
