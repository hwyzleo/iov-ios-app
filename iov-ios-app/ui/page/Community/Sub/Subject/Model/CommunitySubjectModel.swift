//
//  CommunitySubjectModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/1.
//

import SwiftUI

final class CommunitySubjectModel: ObservableObject, CommunitySubjectModelStateProtocol {
    @Published var contentState: CommunitySubjectTypes.Model.ContentState = .content
    let routerSubject = CommunitySubjectRouter.Subjects()
    var subject: Subject = Subject.init(id: "", title: "", userCount: 0, articleCount: 0, defaultContent: [], latestContent: [])
}

// MARK: - Action Protocol

extension CommunitySubjectModel: CommunitySubjectModelActionProtocol {
    func displayLoading() {
        contentState = .loading
    }
    func updateContent(subject: Subject) {
        self.subject = subject
        contentState = .content
    }
    func displayError(text: String) {
        contentState = .error(text: text)
    }
}

// MARK: - Route

extension CommunitySubjectModel: CommunitySubjectModelRouterProtocol {
    func closeScreen() {
        
    }
}

extension CommunitySubjectTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
