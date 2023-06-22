//
//  MyModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class MyModel: ObservableObject, MyModelStateProtocol {
    @Published var contentState: MyTypes.Model.ContentState = .content
    let routerSubject = MyRouter.Subjects()
}

// MARK: - Action Protocol

extension MyModel: MyModelActionProtocol {
    func update() {
        contentState = .content
    }
}

// MARK: - Route

extension MyModel: MyModelRouterProtocol {
    func routeToLogin() {
        routerSubject.screen.send(.login)
    }
    func routeToProfile() {
        routerSubject.screen.send(.profile)
    }
}

extension MyTypes.Model {
    enum ContentState {
        case content
        case error(text: String)
    }
}
