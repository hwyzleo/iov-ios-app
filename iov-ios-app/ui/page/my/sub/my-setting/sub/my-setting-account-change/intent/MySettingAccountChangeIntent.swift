//
//  ProfileIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class MySettingAccountChangeIntent: MviIntentProtocol {
    
    // MARK: Model
    
    private weak var modelAction: MySettingAccountChangeModelActionProtocol?
    private weak var modelRouter: MySettingAccountChangeModelRouterProtocol?
    @AppStorage("userNickname") private var userNickname: String = ""
    @AppStorage("userAvatar") private var userAvatar: String = ""
    
    init(model: MySettingAccountChangeModelActionProtocol & MySettingAccountChangeModelRouterProtocol) {
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

extension MySettingAccountChangeIntent: MySettingAccountChangeIntentProtocol {
}

// MARK: - Helper classes

extension MySettingAccountChangeTypes.Intent {
    struct ExternalData {}
}
