//
//  ProductModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol ProductModelStateProtocol {
    var contentState: ProductTypes.Model.ContentState { get }
    var routerSubject: ProductRouter.Subjects { get }
    var buyCount: Int { get }
}

// MARK: - Intent Action

protocol ProductModelActionProtocol: MviModelActionProtocol {
    /// 用户登出
    func logout()
}

// MARK: - Route

protocol ProductModelRouterProtocol: MviModelRouterProtocol {
    /// 跳转至订单确认页
    func routeToOrderConfirm()
}
