//
//  ProfileIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class MySettingPrivillegeIntent: MviIntentProtocol {
    
    // MARK: Model
    
    private weak var modelAction: MySettingPrivillegeModelActionProtocol?
    private weak var modelRouter: MySettingPrivillegeModelRouterProtocol?
    
    init(model: MySettingPrivillegeModelActionProtocol & MySettingPrivillegeModelRouterProtocol) {
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

extension MySettingPrivillegeIntent: MySettingPrivillegeIntentProtocol {
}

// MARK: - Helper classes

extension MySettingPrivillegeTypes.Intent {
    struct ExternalData {}
}
