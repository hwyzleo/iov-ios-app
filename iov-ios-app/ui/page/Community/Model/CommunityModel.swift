//
//  CommunityModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class CommunityModel: ObservableObject, CommunityModelStateProtocol {
    @Published var contentState: CommunityTypes.Model.ContentState = .content
    let routerSubject = CommunityRouter.Subjects()
    var contentBlocks: [ContentBlock] = []
}

// MARK: - Action Protocol

extension CommunityModel: CommunityModelActionProtocol {
    func displayLoading() {
        contentState = .loading
    }
    func updateContent(contentBlocks: [ContentBlock]) {
        self.contentBlocks = contentBlocks
        contentState = .content
    }
    func displayError(text: String) {
        contentState = .error(text: text)
    }
}

// MARK: - Route

extension CommunityModel: CommunityModelRouterProtocol {
    func closeScreen() {}
    func routeToArticle() {
        routerSubject.screen.send(.article)
    }
    func routeToSubject() {
        routerSubject.screen.send(.subject)
    }
}

extension CommunityTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
