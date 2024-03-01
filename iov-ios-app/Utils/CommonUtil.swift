//
//  Extensions.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import Foundation

/// 转换性别字符串
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

/// 日期转字符串
func dateToStr(date: Date, format: String = "yyyy-MM-dd") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: date)
}

/// 字符串转日期
func strToDate(str: String, format: String = "yyyy-MM-dd") -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    if let date = dateFormatter.date(from: str) {
        return date
    } else {
        return nil
    }
}

/// 显示时间戳
func tsDisplay(ts: Int64) -> String {
    let now = Int64(Date().timeIntervalSince1970*1000)
    let interval = now - ts
    if interval <= 60*1000 {
        return "1分钟内"
    }
    if interval < 60*60*1000 {
        return "\(interval/1000/60)分钟前"
    }
    if interval < 24*60*60*1000 {
        return "\(interval/1000/60/60)小时前"
    }
    return dateToStr(date: Date(timeIntervalSince1970: TimeInterval(ts)), format: "MM-dd HH:mm")
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
