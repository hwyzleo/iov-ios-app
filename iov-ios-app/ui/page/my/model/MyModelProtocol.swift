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
    /// 跳转至设置
    func routeToSetting()
    /// 跳转至简介
    func routeToProfile()
    /// 跳转至我的作品
    func routeToMyArticle()
    /// 跳转至我的积分
    func routeToMyPoints()
    /// 跳转至我的权益
    func routeToMyRights()
    /// 跳转至我的订单
    func routeToMyOrder()
    /// 跳转至邀请好友
    func routeToMyInvite()
}
