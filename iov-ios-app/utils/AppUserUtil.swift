//
//  AppUserUtil.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import Foundation

class AppUserUtil {
    
    static func isLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLogin")
    }
    
    static func login() {
        UserDefaults.standard.set(true, forKey: "isLogin")
    }
    
    static func logout() {
        UserDefaults.standard.set(false, forKey: "isLogin")
    }
}
