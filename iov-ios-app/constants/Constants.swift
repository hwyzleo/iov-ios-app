//
//  Constants.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/12/17.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case Male = "MALE"
    case Female = "FEMALE"
    case Unknown = "UNKNOWN"
    var id: String { self.rawValue }
}
