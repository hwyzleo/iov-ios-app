//
//  ProfileView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import SwiftUI
import WebKit

struct MySettingUserProtocolView: View {
    @EnvironmentObject var appGlobalState: AppGlobalState
    
    var body: some View {
        VStack {
            TopBackTitleBar(title: "用户协议")
            if let url = URL(string: "https://baidu.com") {
                WebView(url: url)
            }
            Spacer()
        }
        .onAppear {
            appGlobalState.currentView = "MySettingUserProtocol"
        }
    }
}

struct MySettingUserProtocolView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        MySettingUserProtocolView.build()
            .environmentObject(appGlobalState)
    }
}
