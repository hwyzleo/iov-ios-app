//
//  MySettingIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

class MyPointsIntent: MviIntentProtocol {
    
    private weak var modelAction: MyPointsModelActionProtocol?
    private weak var modelRouter: MyPointsModelRouterProtocol?
    
    init(model: MyPointsModelActionProtocol & MyPointsModelRouterProtocol) {
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

extension MyPointsIntent: MyPointsIntentProtocol {
}

