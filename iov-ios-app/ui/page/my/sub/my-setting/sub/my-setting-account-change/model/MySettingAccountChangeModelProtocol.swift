//
//  ProfileModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol MySettingAccountChangeModelStateProtocol {
    var contentState: MySettingAccountChangeTypes.Model.ContentState { get }
    var loadingText: String { get }
    var routerSubject: MySettingAccountChangeRouter.Subjects { get }
}

// MARK: - Intent Action

protocol MySettingAccountChangeModelActionProtocol: MviModelActionProtocol {
    func displayLoading()
    func displayError(text: String)
}

// MARK: - Route

protocol MySettingAccountChangeModelRouterProtocol: MviModelRouterProtocol {
}
