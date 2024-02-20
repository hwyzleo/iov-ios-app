//
//  MySettingView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

extension MyRightsView {
    
    static func buildContainer() -> some MviContainer<MyRightsIntentProtocol, MyRightsModelStateProtocol> {
        let model = MyRightsModel()
        let intent = MyRightsIntent(model: model)
        let container = MviContainer(
            intent: intent as MyRightsIntentProtocol,
            model: model as MyRightsModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        return MyRightsView(container: buildContainer())
    }
    
}
