//
//  LoginAction.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

enum LoginAction: MviAction {
    case SendVerifyCode(String, String)
    case VerifyCodeLogin(String, String, String)
}
