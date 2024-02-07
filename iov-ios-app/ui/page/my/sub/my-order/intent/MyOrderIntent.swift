//
//  MySettingIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

class MyOrderIntent: MviIntentProtocol {
    
    private weak var modelAction: MyOrderModelActionProtocol?
    private weak var modelRouter: MyOrderModelRouterProtocol?
    
    init(model: MyOrderModelActionProtocol & MyOrderModelRouterProtocol) {
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

extension MyOrderIntent: MyOrderIntentProtocol {
}

