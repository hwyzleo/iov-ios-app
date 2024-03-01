//
//  CommunityModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/28.
//

import SwiftUI

// MARK: - View State

protocol CommunityArticleModelStateProtocol {
    var contentState: CommunityArticleTypes.Model.ContentState { get }
    var routerSubject: CommunityArticleRouter.Subjects { get }
    var article: Article { get }
}

// MARK: - Intent Action

protocol CommunityArticleModelActionProtocol: MviModelActionProtocol {
    /// 更新页面内容
    func updateContent(article: Article)
    /// 显示错误
    func displayError(text: String)
}

// MARK: - Route

protocol CommunityArticleModelRouterProtocol: MviModelRouterProtocol {
    
}
