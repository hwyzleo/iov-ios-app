//
//  MySettingProfileNicknameView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

extension MySettingProfileAreaView {
    
    static func buildContainer() -> some MviContainer<MySettingProfileAreaIntentProtocol, MySettingProfileAreaModelStateProtocol> {
        let model = MySettingProfileAreaModel()
        let intent = MySettingProfileAreaIntent(model: model)
        let container = MviContainer(
            intent: intent as MySettingProfileAreaIntentProtocol,
            model: model as MySettingProfileAreaModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        let view = MySettingProfileAreaView(container: buildContainer())
        return view
    }
    
}
