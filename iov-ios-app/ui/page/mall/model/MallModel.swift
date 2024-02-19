//
//  MallModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class MallModel: ObservableObject, MallModelStateProtocol {
    @Published var contentState: MallTypes.Model.ContentState = .content
    let routerSubject = MallRouter.Subjects()
}

// MARK: - Action Protocol

extension MallModel: MallModelActionProtocol {
    
    func displayLoading() {
        
    }
    
    func update() {
        contentState = .content
    }
    func logout() {
        
    }
}

// MARK: - Route

extension MallModel: MallModelRouterProtocol {
    func closeScreen() {}
    func routeToLogin() {
        routerSubject.screen.send(.login)
    }
    func routeToProduct() {
        routerSubject.screen.send(.product)
    }
}

extension MallTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
