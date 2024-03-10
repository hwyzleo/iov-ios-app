//
//  OrderModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol OrderModelStateProtocol {
    var contentState: OrderTypes.Model.ContentState { get }
    var routerSubject: OrderRouter.Subjects { get }
    var productOrder: ProductOrder { get }
}

// MARK: - Intent Action

protocol OrderModelActionProtocol: MviModelActionProtocol {
    /// 更新页面内容
    func updateContent(productOrder: ProductOrder)
}

// MARK: - Route

protocol OrderModelRouterProtocol: MviModelRouterProtocol {
    /// 跳转至收货地址页
    func routeToAddress()
}
