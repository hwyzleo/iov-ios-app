//
//  OrderConfirmModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol OrderConfirmModelStateProtocol {
    var contentState: OrderConfirmTypes.Model.ContentState { get }
    var routerSubject: OrderConfirmRouter.Subjects { get }
    var buyCount: Int { get }
}

// MARK: - Intent Action

protocol OrderConfirmModelActionProtocol: MviModelActionProtocol {
    /// 用户登出
    func logout()
}

// MARK: - Route

protocol OrderConfirmModelRouterProtocol: MviModelRouterProtocol {
    /// 跳转至收货地址页
    func routeToAddress()
}
