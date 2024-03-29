//
//  ServiceView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/17.
//

import SwiftUI

extension ServiceView {
    
    static func buildContainer() -> some MviContainer<ServiceIntentProtocol, ServiceModelStateProtocol> {
        let model = ServiceModel()
        let intent = ServiceIntent(model: model)
        let container = MviContainer(
            intent: intent as ServiceIntentProtocol,
            model: model as ServiceModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        return ServiceView(container: buildContainer())
    }
    
}
