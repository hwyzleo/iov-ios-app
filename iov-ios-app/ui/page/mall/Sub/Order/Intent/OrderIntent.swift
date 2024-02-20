//
//  OrderIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class OrderIntent: MviIntentProtocol {
    private weak var modelAction: OrderModelActionProtocol?
    private weak var modelRouter: OrderModelRouterProtocol?
    
    init(model: OrderModelActionProtocol & OrderModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    func viewOnAppear() {}
}

extension OrderIntent: OrderIntentProtocol {
    func onTapAddress() {
        modelRouter?.routeToAddress()
    }
}
