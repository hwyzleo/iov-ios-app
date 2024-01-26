//
//  LoginModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol LoginModelStateProtocol {
    var contentState: LoginTypes.Model.ContentState { get }
    var mobile: String { get }
    var agree: Bool { get }
    var countryRegionCode: String { get }
    var routerSubject: LoginRouter.Subjects { get }
}

// MARK: - Intent Action

protocol LoginModelActionProtocol: MviModelActionProtocol {
    
    /// 切换同意
    func toggleAgreement()
    func routeInputVerify(countryRegionCode: String, mobile: String)
    /// 路由至手机登录页
    func routeMobileLogin()
    func displayError(text: String)
}

// MARK: - Route

protocol LoginModelRouterProtocol: AnyObject {
    /// 关闭登录
    func close()
    /// 跳转至我的页面
    func routeToMy()
}
