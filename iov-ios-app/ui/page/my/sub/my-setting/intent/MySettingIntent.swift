//
//  MySettingIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

class MySettingIntent: MviIntentProtocol {
    
    private weak var modelAction: MySettingModelActionProtocol?
    private weak var modelRouter: MySettingModelRouterProtocol?
    
    init(model: MySettingModelActionProtocol & MySettingModelRouterProtocol) {
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

extension MySettingIntent: MySettingIntentProtocol {
    func onTapBack() {
        modelRouter?.closeScreen()
    }
    func onTapProfile() {
        modelRouter?.routeToProfile()
    }
    func onTapAccountChange() {
        modelRouter?.routeToAccountChange()
    }
    func onTapAccountSecurity() {
        modelRouter?.routeToAccountSecurity()
    }
    func onTapAccountBinding() {
        modelRouter?.routeToAccountBinding()
    }
    func onTapPrivillege() {
        modelRouter?.routeToPrivillege()
    }
    func onTapUserProtocol() {
        modelRouter?.routeToUserProtocol()
    }
    func onTapCommunityConvention() {
        modelRouter?.routeToCommunityConvention()
    }
    func onTapPrivacyAgreement() {
        modelRouter?.routeToPrivacyAgreement()
    }
    func onTapLogout() {
        modelAction?.logout()
    }
}

