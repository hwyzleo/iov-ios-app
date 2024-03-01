//
//  CommunityModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/28.
//

import SwiftUI

// MARK: - View State

protocol CommunityModelStateProtocol {
    var contentState: CommunityTypes.Model.ContentState { get }
    var routerSubject: CommunityRouter.Subjects { get }
    var contentBlocks: [ContentBlock] { get }
}

// MARK: - Intent Action

protocol CommunityModelActionProtocol: MviModelActionProtocol {
    /// 更新内容
    func updateContent(contentBlocks: [ContentBlock])
    /// 显示错误
    func displayError(text: String)
}

// MARK: - Route

protocol CommunityModelRouterProtocol: MviModelRouterProtocol {
    /// 跳转至文章页
    func routeToArticle()
}
