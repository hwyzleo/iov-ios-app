//
//  MySettingIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

class ChargingPileIntent: MviIntentProtocol {
    
    private weak var modelAction: ChargingPileModelActionProtocol?
    private weak var modelRouter: ChargingPileModelRouterProtocol?
    
    init(model: ChargingPileModelActionProtocol & ChargingPileModelRouterProtocol) {
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

extension ChargingPileIntent: ChargingPileIntentProtocol {
}

