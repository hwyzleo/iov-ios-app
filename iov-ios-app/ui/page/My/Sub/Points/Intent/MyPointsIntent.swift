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
    
    func viewOnAppear() {}
}

extension MyPointsIntent: MyPointsIntentProtocol {
}

