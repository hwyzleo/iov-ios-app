//
//  MySettingProfileNicknameIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

protocol MySettingProfileNicknameIntentProtocol {
    /// 页面出现
    func viewOnAppear()
    /// 点击返回个人资料
    func onTapBackProfile()
    /// 点击保存昵称按钮
    func onTapNicknameSaveButton(nickname: String)
}
