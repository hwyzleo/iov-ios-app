//
//  ProfileModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol MySettingPrivillegeModelStateProtocol {
    var contentState: MySettingPrivillegeTypes.Model.ContentState { get }
    var loadingText: String { get }
    var routerSubject: MySettingPrivillegeRouter.Subjects { get }
}

// MARK: - Intent Action

protocol MySettingPrivillegeModelActionProtocol: MviModelActionProtocol {
    func displayLoading()
    func displayError(text: String)
}

// MARK: - Route

protocol MySettingPrivillegeModelRouterProtocol: MviModelRouterProtocol {
}
