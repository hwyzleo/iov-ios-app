//
//  MockVehicleBluetoothManager.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/15.
//

import Foundation
import CoreBluetooth

/// 模拟车辆蓝牙设备
class VehicleBluetoothManager: NSObject {
    public static let shared = VehicleBluetoothManager()
    var peripheralManager: CBPeripheralManager!
    
    override init() {
        super.init()
        peripheralManager = CBPeripheralManager(delegate: self, queue: .main)
    }
}

extension VehicleBluetoothManager {
    /// 开始广播
    func startAdvertising() {
        debugPrint("开始广播车辆蓝牙数据")
        let serviceUUID = CBUUID(string: "EAEC")
        let advertisementData: [String : Any] = [
            CBAdvertisementDataServiceUUIDsKey: [serviceUUID],
            CBAdvertisementDataLocalNameKey: "Vehicle"
        ]
        peripheralManager.startAdvertising(advertisementData)
    }
    /// 停止广播
    func stopAdvertising() {
        debugPrint("停止广播车辆蓝牙数据")
        peripheralManager.stopAdvertising()
    }
}

/// 代理
extension VehicleBluetoothManager: CBPeripheralManagerDelegate {
    /// 状态更新
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            startAdvertising()
        } else {
            print("Bluetooth is not available.")
        }
    }
    /// 收到数据
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        
    }
}
