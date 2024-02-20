//
//  MySettingProfileNicknameModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

// MARK: - View State

protocol MySettingProfileAreaModelStateProtocol {
    var contentState: MySettingProfileAreaTypes.Model.ContentState { get }
    var loadingText: String { get }
    var routerSubject: MySettingProfileAreaRouter.Subjects { get }
    var province: String { get }
}

// MARK: - Intent Action

protocol MySettingProfileAreaModelActionProtocol: MviModelActionProtocol {
    /// 选择省级行政区
    func selectProvince(province: String)
    /// 返回省级行政区
    func backProvince()
    func displayError(text: String)
}

// MARK: - Route

protocol MySettingProfileAreaModelRouterProtocol: MviModelRouterProtocol {
}
