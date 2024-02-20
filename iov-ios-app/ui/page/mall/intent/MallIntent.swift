//
//  MallIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class MallIntent: MviIntentProtocol {
    private weak var modelAction: MallModelActionProtocol?
    private weak var modelRouter: MallModelRouterProtocol?
    
    
    init(model: MallModelActionProtocol & MallModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    /// 页面出现
    func viewOnAppear() {
        
    }
}

extension MallIntent: MallIntentProtocol {
    func onTapProduct(id: String) {
        modelRouter?.routeToProduct()
    }
}
