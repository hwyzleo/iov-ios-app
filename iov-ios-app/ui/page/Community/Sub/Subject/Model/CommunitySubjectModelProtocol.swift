//
//  CommunitySubjectModelStateProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/1.
//

import SwiftUI

// MARK: - View State

protocol CommunitySubjectModelStateProtocol {
    var contentState: CommunitySubjectTypes.Model.ContentState { get }
    var routerSubject: CommunitySubjectRouter.Subjects { get }
    var subject: Subject { get }
}

// MARK: - Intent Action

protocol CommunitySubjectModelActionProtocol: MviModelActionProtocol {
    /// 更新页面内容
    func updateContent(subject: Subject)
}

// MARK: - Route

protocol CommunitySubjectModelRouterProtocol: MviModelRouterProtocol {
    
}
