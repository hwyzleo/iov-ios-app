//
//  MySettingView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

extension MyArticleView {
    
    static func buildContainer() -> some MviContainer<MyArticleIntentProtocol, MyArticleModelStateProtocol> {
        let model = MyArticleModel()
        let intent = MyArticleIntent(model: model)
        let container = MviContainer(
            intent: intent as MyArticleIntentProtocol,
            model: model as MyArticleModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        return MyArticleView(container: buildContainer())
    }
    
}
