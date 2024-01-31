//
//  ProfileIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

protocol MySettingProfileIntentProtocol {
    func viewOnAppear()
    func onSelectAvatar(image: UIImage)
    func onTapBackProfile()
    func onTapNickname()
    func onTapGender()
    func modifyGender(gender: String)
    /// 点击返回设置页
    func onTapBackSetting()
}
