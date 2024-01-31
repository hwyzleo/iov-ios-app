//
//  MySettingModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

final class MySettingModel: ObservableObject, MySettingModelStateProtocol {
    @Published var contentState: MySettingTypes.Model.ContentState = .content
    let routerSubject = MySettingRouter.Subjects()
}

// MARK: - Action Protocol

extension MySettingModel: MySettingModelActionProtocol {
    
    func displayLoading() {}
    
    func update() {
        contentState = .content
    }
    func logout() {
        User.clear()
        routerSubject.screen.send(.my)
    }
}

// MARK: - Route

extension MySettingModel: MySettingModelRouterProtocol {
    func closeScreen() {
        routerSubject.close.send()
    }
    func routeToMy() {
        routerSubject.screen.send(.my)
    }
    func routeToLogin() {
        routerSubject.screen.send(.login)
    }
    func routeToProfile() {
        routerSubject.screen.send(.profile)
    }
    func routeToSetting() {
        routerSubject.screen.send(.setting)
    }
}

extension MySettingTypes.Model {
    enum ContentState {
        case content
        case error(text: String)
    }
}
