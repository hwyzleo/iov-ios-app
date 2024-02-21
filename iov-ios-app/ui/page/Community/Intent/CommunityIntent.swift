//
//  CommunityIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class CommunityIntent: MviIntentProtocol {
    private weak var modelAction: CommunityModelActionProtocol?
    private weak var modelRouter: CommunityModelRouterProtocol?
    
    
    init(model: CommunityModelActionProtocol & CommunityModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    /// 页面出现
    func viewOnAppear() {
        
    }
}

extension CommunityIntent: CommunityIntentProtocol {
    func onTapProduct(id: String) {
        modelRouter?.routeToProduct()
    }
}
