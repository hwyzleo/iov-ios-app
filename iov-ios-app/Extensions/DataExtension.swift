//
//  DataExtension.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/16.
//

import Foundation

extension Data {
    /// 16进制转字符串
    func hexToStr() -> String {
        return map { String(format: "%02x", $0) }
            .joined(separator: "")
    }
}
