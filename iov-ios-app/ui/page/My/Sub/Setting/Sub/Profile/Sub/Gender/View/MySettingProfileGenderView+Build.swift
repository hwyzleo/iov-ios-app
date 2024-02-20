//
//  MySettingProfileNicknameView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

extension MySettingProfileGenderView {
    
    static func buildContainer() -> some MviContainer<MySettingProfileGenderIntentProtocol, MySettingProfileGenderModelStateProtocol> {
        let model = MySettingProfileGenderModel()
        let intent = MySettingProfileGenderIntent(model: model)
        let container = MviContainer(
            intent: intent as MySettingProfileGenderIntentProtocol,
            model: model as MySettingProfileGenderModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        let view = MySettingProfileGenderView(container: buildContainer())
        return view
    }
    
}
