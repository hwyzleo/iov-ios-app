//
//  MySettingIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

class MyRightsIntent: MviIntentProtocol {
    private weak var modelAction: MyRightsModelActionProtocol?
    private weak var modelRouter: MyRightsModelRouterProtocol?
    
    init(model: MyRightsModelActionProtocol & MyRightsModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    func viewOnAppear() {}
}

extension MyRightsIntent: MyRightsIntentProtocol {
}

