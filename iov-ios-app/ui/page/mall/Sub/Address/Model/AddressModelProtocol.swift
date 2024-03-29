//
//  AddressModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol AddressModelStateProtocol {
    var contentState: AddressTypes.Model.ContentState { get }
    var routerSubject: AddressRouter.Subjects { get }
    var buyCount: Int { get }
}

// MARK: - Intent Action

protocol AddressModelActionProtocol: MviModelActionProtocol {
    /// 用户登出
    func logout()
}

// MARK: - Route

protocol AddressModelRouterProtocol: MviModelRouterProtocol {
    
}
