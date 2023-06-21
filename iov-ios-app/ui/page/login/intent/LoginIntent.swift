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
    @AppStorage("userLogin") private var userLogin: Bool = false
    @AppStorage("userNickname") private var userNickname: String = ""
    
    init(model: LoginModelActionProtocol) {
        self.model = model
    }
}

// MARK: - Public

extension LoginIntent: LoginIntentProtocol {
    
    func sendVerifyCode(countryRegionCode: String, mobile: String) {
        model?.displayLoading()
        BaseAPI.requestPost(path: "/account/mp/login/sendVerifyCode", parameters: ["countryRegionCode": countryRegionCode, "mobile": mobile]) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(_):
                self.model?.routeInputVerify(countryRegionCode: countryRegionCode, mobile: mobile)
            case .failure(_):
                self.model?.displayError(text: "请求异常")
            }
        }
    }
    
    func verifyCodeLogin(countryRegionCode: String, mobile: String, verifyCode: String) {
        model?.displayLoading()
        BaseAPI.requestPost(path: "/account/mp/login/verifyCodeLogin", parameters: ["countryRegionCode": countryRegionCode, "mobile": mobile, "verifyCode": verifyCode]) { (result: Result<TspResponse<LoginResponse>, Error>) in
            switch result {
            case let .success(response):
                if response.code == 0 {
                    self.userLogin = true
                    self.userNickname = response.data?.nickname ?? ""
                    self.model?.loginSuccess()
                } else if response.code > 0 {
                    self.model?.displayError(text: response.message ?? "异常")
                }
            case .failure(_):
                self.model?.displayError(text: "请求异常")
            }
        }
    }
    
}
