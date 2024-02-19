//
//  OrderConfirmView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

extension OrderConfirmView {
    
    static func buildContainer() -> some MviContainer<OrderConfirmIntentProtocol, OrderConfirmModelStateProtocol> {
        let model = OrderConfirmModel()
        let intent = OrderConfirmIntent(model: model)
        let container = MviContainer(
            intent: intent as OrderConfirmIntentProtocol,
            model: model as OrderConfirmModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        return OrderConfirmView(container: buildContainer())
    }
    
}
