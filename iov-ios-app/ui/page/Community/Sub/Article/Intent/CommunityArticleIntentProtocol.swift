//
//  CommunityIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/29.
//

protocol CommunityArticleIntentProtocol : MviIntentProtocol {
    /// 页面出现
    func viewOnAppear(id: String)
    /// 点赞
    func onTapLike(id: String, liked: Bool)
}
