//
//  ProfileIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class MySettingAccountBindingIntent: MviIntentProtocol {
    
    // MARK: Model
    
    private weak var modelAction: MySettingAccountBindingModelActionProtocol?
    private weak var modelRouter: MySettingAccountBindingModelRouterProtocol?
    @AppStorage("userNickname") private var userNickname: String = ""
    @AppStorage("userAvatar") private var userAvatar: String = ""
    
    init(model: MySettingAccountBindingModelActionProtocol & MySettingAccountBindingModelRouterProtocol) {
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

extension MySettingAccountBindingIntent: MySettingAccountBindingIntentProtocol {
}

// MARK: - Helper classes

extension MySettingAccountBindingTypes.Intent {
    struct ExternalData {}
}
