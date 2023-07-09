//
//  LoginIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class LoginIntent {
    
    // MARK: - Model
    
    private weak var model: LoginModelActionProtocol?
    private weak var modelRouter: LoginModelRouterProtocol?
    @AppStorage("userLogin") private var userLogin: Bool = false
    @AppStorage("userNickname") private var userNickname: String = ""
    
    init(model: LoginModelActionProtocol & LoginModelRouterProtocol) {
        self.model = model
        self.modelRouter = model
    }
}

// MARK: - Public

extension LoginIntent: LoginIntentProtocol {
    func onTapSendVerifyCodeButton(countryRegionCode: String, mobile: String) {
        model?.displayLoading()
        TspApi.sendVerifyCode(countryRegionCode: countryRegionCode, mobile: mobile) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(_):
                self.model?.routeInputVerify(countryRegionCode: countryRegionCode, mobile: mobile)
            case .failure(_):
                self.model?.displayError(text: "请求异常")
            }
        }
    }
    func onTapVerifyCodeLoginButton(countryRegionCode: String, mobile: String, verifyCode: String) {
        model?.displayLoading()
        TspApi.verifyCodeLogin(countryRegionCode: countryRegionCode, mobile: mobile, verifyCode: verifyCode) { (result: Result<TspResponse<LoginResponse>, Error>) in
            switch result {
            case let .success(response):
                if response.code == 0 {
                    self.userLogin = true
                    self.userNickname = response.data?.nickname ?? ""
                    self.modelRouter?.close()
                } else if response.code > 0 {
                    self.model?.displayError(text: response.message ?? "异常")
                }
            case .failure(_):
                self.model?.displayError(text: "请求异常")
            }
        }
    }
    func onTapBackIcon() {
        modelRouter?.close()
    }
}
