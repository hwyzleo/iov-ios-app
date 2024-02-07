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
    
    func displayLoading() {
        
    }
    
    func update() {
        contentState = .content
    }
    func logout() {
        User.clear()
        routerSubject.screen.send(.my)
    }
}

// MARK: - Route

extension MyModel: MyModelRouterProtocol {
    func closeScreen() {}
    func routeToLogin() {
        routerSubject.screen.send(.login)
    }
    func routeToSetting() {
        routerSubject.screen.send(.setting)
    }
    func routeToProfile() {
        routerSubject.screen.send(.profile)
    }
    func routeToMyArticle() {
        routerSubject.screen.send(.myArticle)
    }
    func routeToMyPoints() {
        routerSubject.screen.send(.myPoints)
    }
    func routeToMyRights() {
        routerSubject.screen.send(.myRights)
    }
    func routeToMyOrder() {
        routerSubject.screen.send(.myOrder)
    }
    func routeToMyInvite() {
        routerSubject.screen.send(.myInvite)
    }
}

extension MyTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
