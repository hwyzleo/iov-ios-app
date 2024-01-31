//
//  ProfileView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

extension MySettingProfileView {
    
    static func build() -> some View {
        let model = MySettingProfileModel()
        let intent = MySettingProfileIntent(model: model)
        let container = MviContainer(
            intent: intent as MySettingProfileIntentProtocol,
            model: model as MySettingProfileModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        let view = MySettingProfileView(container: container)
        return view
    }
    
}
