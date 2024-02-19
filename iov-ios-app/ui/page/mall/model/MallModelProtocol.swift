//
//  MallModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol MallModelStateProtocol {
    var contentState: MallTypes.Model.ContentState { get }
    var routerSubject: MallRouter.Subjects { get }
}

// MARK: - Intent Action

protocol MallModelActionProtocol: MviModelActionProtocol {
    /// 用户登出
    func logout()
}

// MARK: - Route

protocol MallModelRouterProtocol: MviModelRouterProtocol {
    /// 跳转至产品页
    func routeToProduct()
}
