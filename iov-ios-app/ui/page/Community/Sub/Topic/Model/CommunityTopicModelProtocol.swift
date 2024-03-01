//
//  CommunityTopicModelStateProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/1.
//

import SwiftUI

// MARK: - View State

protocol CommunityTopicModelStateProtocol {
    var contentState: CommunityTopicTypes.Model.ContentState { get }
    var routerSubject: CommunityTopicRouter.Subjects { get }
    var topic: Topic { get }
}

// MARK: - Intent Action

protocol CommunityTopicModelActionProtocol: MviModelActionProtocol {
    /// 更新页面内容
    func updateContent(topic: Topic)
}

// MARK: - Route

protocol CommunityTopicModelRouterProtocol: MviModelRouterProtocol {
    
}
