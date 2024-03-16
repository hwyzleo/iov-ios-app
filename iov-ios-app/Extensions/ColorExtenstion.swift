//
//  ColorExtenstion.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/16.
//

import SwiftUI

extension Color {
    /// 颜色支持Hex
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
