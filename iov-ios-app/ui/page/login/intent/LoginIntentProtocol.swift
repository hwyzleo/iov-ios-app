//
//  LoginIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

protocol LoginIntentProtocol {
    
    /// 点击获取验证码
    func onTapSendVerifyCodeButton(countryRegionCode: String, mobile: String)
    func onTapVerifyCodeLoginButton(countryRegionCode: String, mobile: String, verifyCode: String)
    func onTapBackIcon()
}
