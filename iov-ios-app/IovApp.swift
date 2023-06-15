//
//  iov_ios_appApp.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/15.
//

import SwiftUI

@main
struct IovApp: App {
    
    @StateObject var appGlobalState = AppGlobalState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appGlobalState)
        }
    }
}
