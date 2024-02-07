//
//  MySettingModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import Foundation

// MARK: - View State

protocol MyInviteModelStateProtocol {
    var contentState: MyInviteTypes.Model.ContentState { get }
    var routerSubject: MyInviteRouter.Subjects { get }
}

// MARK: - Intent Action

protocol MyInviteModelActionProtocol: MviModelActionProtocol {
}

// MARK: - Route

protocol MyInviteModelRouterProtocol: MviModelRouterProtocol {
}
