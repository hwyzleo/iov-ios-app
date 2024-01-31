//
//  MyModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol MyModelStateProtocol {
    var contentState: MyTypes.Model.ContentState { get }
    var routerSubject: MyRouter.Subjects { get }
}

// MARK: - Intent Action

protocol MyModelActionProtocol: MviModelActionProtocol {
    /// 用户登出
    func logout()
}

// MARK: - Route

protocol MyModelRouterProtocol: MviModelRouterProtocol {
    /// 跳转至简介
    func routeToProfile()
    /// 跳转至设置
    func routeToSetting()
}
