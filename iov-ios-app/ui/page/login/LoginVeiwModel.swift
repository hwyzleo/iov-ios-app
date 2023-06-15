//
//  LoginVeiwModel.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/13.
//

import Foundation
import SwiftUI

class LoginViewModel: BaseViewModel<LoginIntent, LoginAction, LoginState> {
    
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    init() {
        super.init(viewState: LoginState())
    }
    
    override func dispatch(intent: LoginIntent) {
        let action = actionFromIntent(intent: intent)
        executeAction(action: action)
    }

    override func actionFromIntent(intent: LoginIntent) -> LoginAction {
        switch(intent) {
        case .SendVerifyCode(let countryRegionCode, let mobile):
            return LoginAction.SendVerifyCode(countryRegionCode, mobile)
        case .VerifyCodeLogin(let countryRegionCode, let mobile, let verifyCode):
            return LoginAction.VerifyCodeLogin(countryRegionCode, mobile, verifyCode)
        }
    }
    
    override func executeAction(action: LoginAction) {
        switch(action) {
        case .SendVerifyCode(let countryRegionCode, let mobile):
            sendVerifyCode(countryRegionCode: countryRegionCode, mobile: mobile)
        case .VerifyCodeLogin(let countryRegionCode, let mobile, let verifyCode):
            verifyCodeLogin(countryRegionCode: countryRegionCode, mobile: mobile, verifyCode: verifyCode)
        }
    }
    
    private func sendVerifyCode(countryRegionCode: String, mobile: String) {
        BaseAPI.requestPost(path: "/login/sendVerifyCode", parameters: ["countryRegionCode": countryRegionCode, "mobile": mobile]) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(_):
                self.viewState.isSendVerifyCode = true
            case let .failure(error):
                print(error)
                self.viewState.isSendVerifyCode = false
            }
        }
    }
    
    private func verifyCodeLogin(countryRegionCode: String, mobile: String, verifyCode: String) {
        BaseAPI.requestPost(path: "/login/verifyCodeLogin", parameters: ["countryRegionCode": countryRegionCode, "mobile": mobile, "verifyCode": verifyCode]) { (result: Result<TspResponse<UserInfo>, Error>) in
            switch result {
            case let .success(data):
                if data.code == 0 {
                    self.isLoggedIn = true
                    AppUserUtil.login()
                } else if data.code > 0 {
                    print(data.message ?? "异常")
                }
            case let .failure(error):
                print(error)
            }
        }
    }

}
