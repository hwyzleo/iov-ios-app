//
//  MySettingIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

class MyInviteIntent: MviIntentProtocol {
    private weak var modelAction: MyInviteModelActionProtocol?
    private weak var modelRouter: MyInviteModelRouterProtocol?
    
    init(model: MyInviteModelActionProtocol & MyInviteModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    /// 页面出现
    func viewOnAppear() {
        
    }
}

extension MyInviteIntent: MyInviteIntentProtocol {
}

