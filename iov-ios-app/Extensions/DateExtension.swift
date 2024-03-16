//
//  DateExtension.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/16.
//

import Foundation

extension Date {
    
    func timestamp() -> Int64 {
        return Int64(self.timeIntervalSince1970*1000)
    }
}
