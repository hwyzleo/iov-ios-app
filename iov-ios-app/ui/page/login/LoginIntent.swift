//
//  LoginIntent.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/13.
//

enum LoginIntent: MviIntent {
    case SendVerifyCode(String, String)
    case VerifyCodeLogin(String, String, String)
}
