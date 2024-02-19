//
//  OrderConfirmModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class OrderConfirmModel: ObservableObject, OrderConfirmModelStateProtocol {
    @Published var contentState: OrderConfirmTypes.Model.ContentState = .content
    let routerSubject = OrderConfirmRouter.Subjects()
    var buyCount: Int = 1
}

// MARK: - Action Protocol

extension OrderConfirmModel: OrderConfirmModelActionProtocol {
    
    func displayLoading() {
        
    }
    
    func update() {
        contentState = .content
    }
    func logout() {

    }
}

// MARK: - Route

extension OrderConfirmModel: OrderConfirmModelRouterProtocol {
    func closeScreen() {}
    func routeToLogin() {
        routerSubject.screen.send(.login)
    }
    func routeToAddress() {
        routerSubject.screen.send(.address)
    }
}

extension OrderConfirmTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
