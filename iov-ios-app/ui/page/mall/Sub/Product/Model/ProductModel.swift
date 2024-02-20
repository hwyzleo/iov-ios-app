//
//  ProductModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class ProductModel: ObservableObject, ProductModelStateProtocol {
    @Published var contentState: ProductTypes.Model.ContentState = .content
    let routerSubject = ProductRouter.Subjects()
    var buyCount: Int = 1
}

// MARK: - Action Protocol

extension ProductModel: ProductModelActionProtocol {
    
    func displayLoading() {
        
    }
    
    func update() {
        contentState = .content
    }
    func logout() {
        
    }
}

// MARK: - Route

extension ProductModel: ProductModelRouterProtocol {
    func closeScreen() {}
    func routeToOrderConfirm() {
        routerSubject.screen.send(.orderConfirm)
    }
}

extension ProductTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
