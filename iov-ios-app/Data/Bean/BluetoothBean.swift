//
//  BluetoothBean.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/16.
//

import Foundation

struct CmdData: Codable {
    
}

struct BluetoothResponse<Model: Codable>: Codable {
    var code: Int
    var message: String?
    var ts: Int64
    var data: Model?
}
