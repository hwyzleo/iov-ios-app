//
//  ProfileView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

extension MySettingAccountChangeView {
    
    static func buildContainer() -> some MviContainer<MySettingAccountChangeIntentProtocol, MySettingAccountChangeModelStateProtocol> {
        let model = MySettingAccountChangeModel()
        let intent = MySettingAccountChangeIntent(model: model)
        let container = MviContainer(
            intent: intent as MySettingAccountChangeIntentProtocol,
            model: model as MySettingAccountChangeModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        let view = MySettingAccountChangeView(container: buildContainer())
        return view
    }
    
}
