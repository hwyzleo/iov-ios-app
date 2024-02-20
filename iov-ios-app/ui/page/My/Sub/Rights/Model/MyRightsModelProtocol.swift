//
//  MySettingModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import Foundation

// MARK: - View State

protocol MyRightsModelStateProtocol {
    var contentState: MyRightsTypes.Model.ContentState { get }
    var routerSubject: MyRightsRouter.Subjects { get }
}

// MARK: - Intent Action

protocol MyRightsModelActionProtocol: MviModelActionProtocol {
}

// MARK: - Route

protocol MyRightsModelRouterProtocol: MviModelRouterProtocol {
}
