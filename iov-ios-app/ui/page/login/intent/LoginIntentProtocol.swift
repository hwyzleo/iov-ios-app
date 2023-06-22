//
//  LoginIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

protocol LoginIntentProtocol {
    func onTapSendVerifyCodeButton(countryRegionCode: String, mobile: String)
    func onTapVerifyCodeLoginButton(countryRegionCode: String, mobile: String, verifyCode: String)
    func onTapBackIcon()
}
