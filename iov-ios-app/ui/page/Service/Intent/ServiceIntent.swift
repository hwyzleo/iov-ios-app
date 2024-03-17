//
//  ServiceIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/17.
//

import SwiftUI

class ServiceIntent: MviIntentProtocol {
    private weak var modelAction: ServiceModelActionProtocol?
    private weak var modelRouter: ServiceModelRouterProtocol?
    
    init(model: ServiceModelActionProtocol & ServiceModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    func viewOnAppear() {
        
    }
}

extension ServiceIntent: ServiceIntentProtocol {
    
}
