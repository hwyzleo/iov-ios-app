//
//  MySettingIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

protocol MySettingIntentProtocol : MviIntentProtocol {
    
    /// 点击返回
    func onTapBack()
    /// 点击登出
    func onTapLogout()
    /// 点击个人资料
    func onTapProfile()
    
}
