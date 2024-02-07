//
//  MySettingModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

final class MyOrderModel: ObservableObject, MyOrderModelStateProtocol {
    @Published var contentState: MyOrderTypes.Model.ContentState = .content
    let routerSubject = MyOrderRouter.Subjects()
}

// MARK: - Action Protocol

extension MyOrderModel: MyOrderModelActionProtocol {
    
    func displayLoading() {}
    
}

// MARK: - Route

extension MyOrderModel: MyOrderModelRouterProtocol {
    func routeToLogin() {
        
    }
    
    func closeScreen() {
        
    }
    
}

extension MyOrderTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
