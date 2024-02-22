//
//  VehicleIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class VehicleIntent: MviIntentProtocol {
    private weak var modelAction: VehicleModelActionProtocol?
    private weak var modelRouter: VehicleModelRouterProtocol?
    
    
    init(model: VehicleModelActionProtocol & VehicleModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    /// 页面出现
    func viewOnAppear() {
        
    }
}

extension VehicleIntent: VehicleIntentProtocol {
    func onTapProduct(id: String) {
        modelRouter?.routeToProduct()
    }
}
