//
//  VehicleModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol VehicleModelStateProtocol {
    var contentState: VehicleTypes.Model.ContentState { get }
    var routerSubject: VehicleRouter.Subjects { get }
}

// MARK: - Intent Action

protocol VehicleModelActionProtocol: MviModelActionProtocol {
    /// 用户登出
    func logout()
}

// MARK: - Route

protocol VehicleModelRouterProtocol: MviModelRouterProtocol {
    /// 跳转至产品页
    func routeToProduct()
}