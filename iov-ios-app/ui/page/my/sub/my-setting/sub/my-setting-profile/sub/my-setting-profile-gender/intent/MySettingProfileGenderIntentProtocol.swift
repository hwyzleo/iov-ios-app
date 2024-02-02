//
//  MySettingProfileNicknameIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

protocol MySettingProfileGenderIntentProtocol: MviIntentProtocol {
    /// 点击返回个人资料
    func onTapBackProfile()
    /// 点击保存性别按钮
    func onTapGenderSaveButton(gender: String)
}