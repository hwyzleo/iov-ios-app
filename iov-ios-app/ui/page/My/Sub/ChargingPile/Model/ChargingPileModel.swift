//
//  MySettingModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

final class ChargingPileModel: ObservableObject, ChargingPileModelStateProtocol {
    @Published var contentState: ChargingPileTypes.Model.ContentState = .content
    let routerSubject = ChargingPileRouter.Subjects()
}

// MARK: - Action Protocol

extension ChargingPileModel: ChargingPileModelActionProtocol {
    
    func displayLoading() {}
    func displayError(text: String) {
        
    }
}

// MARK: - Route

extension ChargingPileModel: ChargingPileModelRouterProtocol {
    func routeToLogin() {
        
    }
    
    func closeScreen() {
        
    }
    
}

extension ChargingPileTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
