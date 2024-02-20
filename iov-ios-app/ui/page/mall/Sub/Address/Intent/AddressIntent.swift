//
//  AddressIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class AddressIntent: MviIntentProtocol {
    private weak var modelAction: AddressModelActionProtocol?
    private weak var modelRouter: AddressModelRouterProtocol?
    
    init(model: AddressModelActionProtocol & AddressModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    func viewOnAppear() {}
}

extension AddressIntent: AddressIntentProtocol {
    func onTapSaveAddressButton() {
        modelRouter?.closeScreen()
        modelRouter?.closeScreen()
    }
}
