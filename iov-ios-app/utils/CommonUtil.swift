//
//  Extensions.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import Foundation

func genderStr(_ gender: String) -> String {
    switch gender {
    case "MALE":
        return "男"
    case "FEMALE":
        return "女"
    default:
        return "未知"
    }
}

/// 写信息入本地
func setInfo(_ key: String, value: String) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}
/// 信息从本地读取
func getInfo(_ key: String) -> String {
    let str = (UserDefaults.standard.object(forKey: key) as? String)
    return str ?? ""
}
