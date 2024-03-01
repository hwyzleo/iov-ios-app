//
//  OrderModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class OrderModel: ObservableObject, OrderModelStateProtocol {
    @Published var contentState: OrderTypes.Model.ContentState = .content
    let routerSubject = OrderRouter.Subjects()
    var buyCount: Int = 1
}

// MARK: - Action Protocol

extension OrderModel: OrderModelActionProtocol {
    
    func displayLoading() {
        
    }
    
    func update() {
        contentState = .content
    }
    func logout() {

    }
    func displayError(text: String) {
        
    }
}

// MARK: - Route

extension OrderModel: OrderModelRouterProtocol {
    func closeScreen() {}
    func routeToLogin() {
        routerSubject.screen.send(.login)
    }
    func routeToAddress() {
        routerSubject.screen.send(.address)
    }
}

extension OrderTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
