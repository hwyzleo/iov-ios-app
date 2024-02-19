//
//  ProductIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class ProductIntent: MviIntentProtocol {
    
    private weak var modelAction: ProductModelActionProtocol?
    private weak var modelRouter: ProductModelRouterProtocol?
    
    init(model: ProductModelActionProtocol & ProductModelRouterProtocol) {
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

extension ProductIntent: ProductIntentProtocol {
    func onTapBuyButton() {
        modelRouter?.routeToOrderConfirm()
    }
}
