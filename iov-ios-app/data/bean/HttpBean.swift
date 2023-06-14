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
 * 用户信息
 */
struct UserInfo: Codable {
    var token: String
    var mobile: String
}
