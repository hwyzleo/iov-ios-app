//
//  MySettingView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

extension MyPointsView {
    
    static func buildContainer() -> some MviContainer<MyPointsIntentProtocol, MyPointsModelStateProtocol> {
        let model = MyPointsModel()
        let intent = MyPointsIntent(model: model)
        let container = MviContainer(
            intent: intent as MyPointsIntentProtocol,
            model: model as MyPointsModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        return MyPointsView(container: buildContainer())
    }
    
}
