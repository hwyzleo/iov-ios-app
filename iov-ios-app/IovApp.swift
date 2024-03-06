//
//  iov_ios_appApp.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/15.
//

import SwiftUI
import AVFoundation
import Photos

@main
struct IovApp: App {
    
    @StateObject var appGlobalState = AppGlobalState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appGlobalState)
                .onAppear() {
                    requestNotificationPrivillege()
                }
        }
    }
}

/// 请求通知权限
func requestNotificationPrivillege() {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if granted {
            print("通知权限已获得")
        } else {
            print("通知权限未获得")
        }
    }
}
