//
//  ProductView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

extension ProductView {
    
    static func buildContainer() -> some MviContainer<ProductIntentProtocol, ProductModelStateProtocol> {
        let model = ProductModel()
        let intent = ProductIntent(model: model)
        let container = MviContainer(
            intent: intent as ProductIntentProtocol,
            model: model as ProductModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        return ProductView(container: buildContainer())
    }
    
    static func buildBuyConfirm() -> some View {
        let container = buildContainer()
        return ProductView.BuyConfirm(state: container.model, intent: container.intent)
    }
    
}
