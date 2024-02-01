//
//  HttpBean.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

/**
 * TSP平台通用响应实体
 */
struct TspResponse<Model: Codable>: Codable {
    var code: Int
    var message: String?
    var ts: Int64
    var data: Model?
}

/**
 * 无响应内容
 */
struct NoReply: Codable {}

/**
 * 登录响应
 */
struct LoginResponse: Codable {
    var mobile: String
    var nickname: String
    var avatar: String
    var token: String
    var tokenExpires: Int64
    var refreshToken: String
    var refreshTokenExpires: Int64
}

/**
 * 账号信息
 */
struct AccountInfo: Codable {
    var mobile: String
    var nickname: String
    var avatar: String?
    var gender: String
    var birthday: String?
}

/**
 * 预签名上传地址
 */
struct PreSignedUrl: Codable {
    var uploadUrl: String
    var objectKey: String
}
