//
//  VehicleModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class VehicleModel: ObservableObject, VehicleModelStateProtocol {
    @Published var contentState: VehicleTypes.Model.ContentState = .content
    let routerSubject = VehicleRouter.Subjects()
}

// MARK: - Action Protocol

extension VehicleModel: VehicleModelActionProtocol {
    
    func displayLoading() {
        
    }
    
    func update() {
        contentState = .content
    }
    func logout() {
        
    }
    func displayError(text: String) {
        
    }
}

// MARK: - Route

extension VehicleModel: VehicleModelRouterProtocol {
    func closeScreen() {}
    func routeToProduct() {
        routerSubject.screen.send(.product)
    }
}

extension VehicleTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
