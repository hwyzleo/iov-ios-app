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
    var area: String?
}

/**
 * 预签名上传地址
 */
struct PreSignedUrl: Codable {
    var uploadUrl: String
    var objectKey: String
}

/// 内容块
struct ContentBlock: Codable {
    var id: String
    var type: String
    var title: String?
    var data: [BaseContent]
}

/// 基础内容
struct BaseContent: Codable {
    var id: String
    var type: String
    var title: String
    var intro: String?
    var images: [String]
    var ts: Int64
    var username: String?
    var avatar: String?
    var location: String?
    var tags: [String]?
    var commentCount: Int64?
    var likeCount: Int64?
}

/// 文章
struct Article: Codable {
    var id: String
    var title: String
    var content: String
    var images: [String]
    var ts: Int64
    var username: String
    var avatar: String?
    var views: Int64
    var location: String?
    var tags: [String]
    var comments: [ArticleComment]
    var likeCount: Int64
    var liked: Bool
    var shareCount: Int64
}

/// 文章评论
struct ArticleComment: Codable {
    var id: String
    var parentId: String
    var comment: String
    var replyer: String?
    var ts: Int64
    var username: String
    var avatar: String?
    var location: String?
}

/// 主题
struct Subject: Codable {
    var id: String
    var title: String
    var content: String?
    var image: String?
    var endTs: Int64?
    var userCount: Int64
    var articleCount: Int64
    var defaultContent: [BaseContent]
    var latestContent: [BaseContent]
}

/// 专题
struct Topic: Codable {
    var id: String
    var title: String
    var content: String?
    var image: String?
    var contents: [BaseContent]
}
