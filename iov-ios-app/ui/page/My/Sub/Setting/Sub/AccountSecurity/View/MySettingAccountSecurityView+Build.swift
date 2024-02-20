//
//  ProfileView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

extension MySettingAccountSecurityView {
    
    static func buildContainer() -> some MviContainer<MySettingAccountSecurityIntentProtocol, MySettingAccountSecurityModelStateProtocol> {
        let model = MySettingAccountSecurityModel()
        let intent = MySettingAccountSecurityIntent(model: model)
        let container = MviContainer(
            intent: intent as MySettingAccountSecurityIntentProtocol,
            model: model as MySettingAccountSecurityModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        let view = MySettingAccountSecurityView(container: buildContainer())
        return view
    }
    
}
