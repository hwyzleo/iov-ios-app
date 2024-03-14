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
    
    func viewOnAppear() {
        modelAction?.displayLoading()
        TspApi.getVehicleIndex() { (result: Result<TspResponse<VehicleIndex>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    self.modelAction?.updateContent(vehicleIndex: response.data!)
                } else {
                    self.modelAction?.displayError(text: response.message ?? "异常")
                }
            case let .failure(error):
                print(error)
                self.modelAction?.displayError(text: "请求异常")
            }
        }
    }
}

extension VehicleIntent: VehicleIntentProtocol {
    func onTapScan() {
        modelRouter?.routeToScan()
    }
    func onTapLock() {
        
    }
    func onTapUnlock() {
        TspApi.unlockVehicle() { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
//                    self.modelAction?.updateContent()
                } else {
                    self.modelAction?.displayError(text: response.message ?? "异常")
                }
            case let .failure(error):
                print(error)
                self.modelAction?.displayError(text: "请求异常")
            }
        }
    }
}
