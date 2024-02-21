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
}

// MARK: - Action Protocol

extension CommunityModel: CommunityModelActionProtocol {
    
    func displayLoading() {
        
    }
    
    func update() {
        contentState = .content
    }
    func logout() {
        
    }
}

// MARK: - Route

extension CommunityModel: CommunityModelRouterProtocol {
    func closeScreen() {}
    func routeToProduct() {
        routerSubject.screen.send(.product)
    }
}

extension CommunityTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
