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
    var vehicle: Vehicle = Vehicle.init(vin: "", drivingRange: 0, electricDrivingRange: 0, electricPercentage: 0, fuelDrivingRange: 0, fuelPercentage: 0, interiorTemp: 0, flTirePressure: 0, flTireTemp: 0, frTirePressure: 0, frTireTemp: 0, rlTirePressure: 0, rlTireTemp: 0, rrTirePressure: 0, rrTireTemp: 0, lockState: false)
}

// MARK: - Action Protocol

extension VehicleModel: VehicleModelActionProtocol {
    func displayLoading() {
        contentState = .loading
    }
    func updateContent(vehicleIndex: VehicleIndex) {
        self.vehicle = vehicleIndex.vehicle
        contentState = .content
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
