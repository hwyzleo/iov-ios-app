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
