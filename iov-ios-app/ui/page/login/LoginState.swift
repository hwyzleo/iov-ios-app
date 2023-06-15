//
//  LoginState.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

struct LoginState: MviState {
    var countryCode: String = "+86"
    var mobile: String = ""
    var isSendVerifyCode: Bool = false
}
