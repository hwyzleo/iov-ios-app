//
//  AddressView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

extension AddressView {
    
    static func buildContainer() -> some MviContainer<AddressIntentProtocol, AddressModelStateProtocol> {
        let model = AddressModel()
        let intent = AddressIntent(model: model)
        let container = MviContainer(
            intent: intent as AddressIntentProtocol,
            model: model as AddressModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        return AddressView(container: buildContainer())
    }
    
}
