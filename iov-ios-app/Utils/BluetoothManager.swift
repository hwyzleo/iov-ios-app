//
//  BluetoothManager.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/6.
//

import CoreBluetooth

class BluetoothManager: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    var centralManager: CBCentralManager!
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        var consoleLog = ""

        switch central.state {
        case .poweredOff:
          consoleLog = "BLE is powered off"
        case .poweredOn:
          consoleLog = "BLE is poweredOn"
        case .resetting:
          consoleLog = "BLE is resetting"
        case .unauthorized:
          consoleLog = "BLE is unauthorized"
        case .unknown:
          consoleLog = "BLE is unknown"
        case .unsupported:
          consoleLog = "BLE is unsupported"
        default:
          consoleLog = "default"
        }
        print(consoleLog)
    }
    
    
}
