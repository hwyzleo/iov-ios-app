//
//  AddressModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class AddressModel: ObservableObject, AddressModelStateProtocol {
    @Published var contentState: AddressTypes.Model.ContentState = .content
    let routerSubject = AddressRouter.Subjects()
    var buyCount: Int = 1
}

// MARK: - Action Protocol

extension AddressModel: AddressModelActionProtocol {
    
    func displayLoading() {
        
    }
    
    func update() {
        contentState = .content
    }
    func logout() {
        User.clear()
        routerSubject.screen.send(.Address)
    }
}

// MARK: - Route

extension AddressModel: AddressModelRouterProtocol {
    func closeScreen() {}
    func routeToLogin() {
        routerSubject.screen.send(.login)
    }
}

extension AddressTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
