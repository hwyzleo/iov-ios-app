//
//  ProfileIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class MySettingAccountSecurityIntent: MviIntentProtocol {
    
    // MARK: Model
    
    private weak var modelAction: MySettingAccountSecurityModelActionProtocol?
    private weak var modelRouter: MySettingAccountSecurityModelRouterProtocol?
    @AppStorage("userNickname") private var userNickname: String = ""
    @AppStorage("userAvatar") private var userAvatar: String = ""
    
    init(model: MySettingAccountSecurityModelActionProtocol & MySettingAccountSecurityModelRouterProtocol) {
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

// MARK: Public

extension MySettingAccountSecurityIntent: MySettingAccountSecurityIntentProtocol {
}

// MARK: - Helper classes

extension MySettingAccountSecurityTypes.Intent {
    struct ExternalData {}
}
