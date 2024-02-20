//
//  ProfileIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class MySettingAccountBindingIntent: MviIntentProtocol {
    private weak var modelAction: MySettingAccountBindingModelActionProtocol?
    private weak var modelRouter: MySettingAccountBindingModelRouterProtocol?
    
    init(model: MySettingAccountBindingModelActionProtocol & MySettingAccountBindingModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    func viewOnAppear() {}
}

// MARK: Public

extension MySettingAccountBindingIntent: MySettingAccountBindingIntentProtocol {
}

// MARK: - Helper classes

extension MySettingAccountBindingTypes.Intent {
    struct ExternalData {}
}
