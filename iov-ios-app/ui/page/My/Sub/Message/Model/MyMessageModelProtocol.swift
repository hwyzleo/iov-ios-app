//
//  MyMessageModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/5.
//

import Foundation

// MARK: - View State

protocol MyMessageModelStateProtocol {
    var contentState: MyMessageTypes.Model.ContentState { get }
    var routerSubject: MyMessageRouter.Subjects { get }
}

// MARK: - Intent Action

protocol MyMessageModelActionProtocol: MviModelActionProtocol {
    /// 用户登出
    func logout()
}

// MARK: - Route

protocol MyMessageModelRouterProtocol: MviModelRouterProtocol {
    
}
