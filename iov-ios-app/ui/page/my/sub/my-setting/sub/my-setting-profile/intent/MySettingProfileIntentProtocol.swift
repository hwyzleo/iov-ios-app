//
//  ProfileIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

protocol MySettingProfileIntentProtocol: MviIntentProtocol {
    func onSelectAvatar(image: UIImage)
    /// 点击昵称
    func onTapNickname()
    /// 点击性别
    func onTapGender()
    /// 点击生日保存按钮
    func onTapBirthdaySaveButton(date: Date)
    /// 点击地区
    func onTapArea()
    /// 点击返回设置页
    func onTapBackSetting()
}
