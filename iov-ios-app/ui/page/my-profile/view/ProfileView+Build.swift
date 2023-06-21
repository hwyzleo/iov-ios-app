//
//  ProfileView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

extension ProfileView {
    
    static func build() -> some View {
        let model = ProfileModel()
        let intent = ProfileIntent(model: model)
        let container = MviContainer(
            intent: intent as ProfileIntentProtocol,
            model: model as ProfileModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        let view = ProfileView(container: container)
        return view
    }
    
}
