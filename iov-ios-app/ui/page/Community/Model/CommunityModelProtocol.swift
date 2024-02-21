//
//  CommunityModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol CommunityModelStateProtocol {
    var contentState: CommunityTypes.Model.ContentState { get }
    var routerSubject: CommunityRouter.Subjects { get }
}

// MARK: - Intent Action

protocol CommunityModelActionProtocol: MviModelActionProtocol {
    /// 用户登出
    func logout()
}

// MARK: - Route

protocol CommunityModelRouterProtocol: MviModelRouterProtocol {
    /// 跳转至产品页
    func routeToProduct()
}
