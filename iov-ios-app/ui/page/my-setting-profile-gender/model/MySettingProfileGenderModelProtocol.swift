//
//  MySettingProfileNicknameModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

// MARK: - View State

protocol MySettingProfileGenderModelStateProtocol {
    var contentState: MySettingProfileGenderTypes.Model.ContentState { get }
    var loadingText: String { get }
    var routerSubject: MySettingProfileGenderRouter.Subjects { get }
    var gender: String { get }
}

// MARK: - Intent Action

protocol MySettingProfileGenderModelActionProtocol: MviModelActionProtocol {
    /// 更新性别
    func updateGender(gender: String)
    func displayError(text: String)
}

// MARK: - Route

protocol MySettingProfileGenderModelRouterProtocol: MviModelRouterProtocol {
}
