//
//  MyView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

extension MyView {
    
    static func build() -> some View {
        let model = MyModel()
        let intent = MyIntent(model: model)
        let container = MviContainer(
            intent: intent as MyIntentProtocol,
            model: model as MyModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        let view = MyView(container: container)
        return view
    }
    
}
