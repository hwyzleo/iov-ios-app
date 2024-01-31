//
//  MySettingProfileNicknameView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

extension MySettingProfileNicknameView {
    
    static func buildContainer() -> some MviContainer<MySettingProfileNicknameIntentProtocol, MySettingProfileNicknameModelStateProtocol> {
        let model = MySettingProfileNicknameModel()
        let intent = MySettingProfileNicknameIntent(model: model)
        let container = MviContainer(
            intent: intent as MySettingProfileNicknameIntentProtocol,
            model: model as MySettingProfileNicknameModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        let view = MySettingProfileNicknameView(container: buildContainer())
        return view
    }
    
}
