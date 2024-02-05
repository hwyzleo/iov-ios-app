//
//  ProfileModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol MySettingAccountSecurityModelStateProtocol {
    var contentState: MySettingAccountSecurityTypes.Model.ContentState { get }
    var loadingText: String { get }
    var routerSubject: MySettingAccountSecurityRouter.Subjects { get }
}

// MARK: - Intent Action

protocol MySettingAccountSecurityModelActionProtocol: MviModelActionProtocol {
    func displayLoading()
    func displayError(text: String)
}

// MARK: - Route

protocol MySettingAccountSecurityModelRouterProtocol: MviModelRouterProtocol {
}
