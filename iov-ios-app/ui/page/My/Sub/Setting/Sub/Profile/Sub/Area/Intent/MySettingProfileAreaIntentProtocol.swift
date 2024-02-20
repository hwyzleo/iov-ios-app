//
//  MySettingProfileNicknameIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

protocol MySettingProfileAreaIntentProtocol: MviIntentProtocol {
    /// 点击返回个人资料
    func onTapBackProfile()
    /// 点击省级行政区
    func onTapProvince(province: String)
    /// 点击返回省级行政区
    func onTapBackProvince()
    /// 点击市级行政区
    func onTapCity(city: String)
    /// 点击保存性别按钮
    func onTapGenderSaveButton(gender: String)
}
