//
//  MyIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class MyIntent: MviIntentProtocol {
    
    private weak var modelAction: MyModelActionProtocol?
    private weak var modelRouter: MyModelRouterProtocol?
    
    init(model: MyModelActionProtocol & MyModelRouterProtocol) {
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

extension MyIntent: MyIntentProtocol {
    
    /// 点击用户资料
    func onTapProfile() {
        modelRouter?.routeToProfile()
    }
    
    func onTapLogout() {
        modelAction?.logout()
    }
    
}
