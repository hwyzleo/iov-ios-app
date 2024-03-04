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
                    requestVideoPrivillege()
                    requestPhotoPrivillege()
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

/// 请求相机权限
func requestVideoPrivillege() {
    let videoStatus = AVCaptureDevice.authorizationStatus(for: .video)
    if videoStatus == .notDetermined{
        AVCaptureDevice.requestAccess(for: .video) {_ in 

        }
        return
    }
}

/// 请求相册权限
func requestPhotoPrivillege() {
    if #available(iOS 14, *) {
        let readWriteStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        print(readWriteStatus)
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { (status) in
            
        }
    } else {
        let readWriteStatus = PHPhotoLibrary.authorizationStatus()
        print(readWriteStatus)
        PHPhotoLibrary.requestAuthorization { (status) in
            
        }
    }
}
