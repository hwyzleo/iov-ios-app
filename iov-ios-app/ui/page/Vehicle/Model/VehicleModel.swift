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
        contentState = .loading
    }
    func displayError(text: String) {
        contentState = .error(text: text)
    }
}

// MARK: - Route

extension VehicleModel: VehicleModelRouterProtocol {
    func closeScreen() {}
    func routeToScan() {
        routerSubject.screen.send(.scan)
    }
}

extension VehicleTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
