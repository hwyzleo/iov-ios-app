//
//  OrderConfirmIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class OrderConfirmIntent: MviIntentProtocol {
    
    private weak var modelAction: OrderConfirmModelActionProtocol?
    private weak var modelRouter: OrderConfirmModelRouterProtocol?
    
    init(model: OrderConfirmModelActionProtocol & OrderConfirmModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    /// 页面出现
    func viewOnAppear() {
        
    }
    
    /// 点击登录
    func onTapLogin() {
        modelRouter?.routeToLogin()
    }
    
}

extension OrderConfirmIntent: OrderConfirmIntentProtocol {
    func onTapAddress() {
        modelRouter?.routeToAddress()
    }
}
