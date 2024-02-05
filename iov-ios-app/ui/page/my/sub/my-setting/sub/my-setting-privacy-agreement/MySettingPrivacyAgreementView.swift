//
//  ProfileView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import SwiftUI
import WebKit

struct MySettingPrivacyAgreementView: View {
    @EnvironmentObject var appGlobalState: AppGlobalState
    
    var body: some View {
        VStack {
            TopBackTitleBar(title: "隐私政策")
            if let url = URL(string: "https://www.163.com") {
                WebView(url: url)
            }
            Spacer()
        }
        .onAppear {
            appGlobalState.currentView = "MySettingPrivacyAgreement"
        }
    }
}

struct MySettingPrivacyAgreementView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        MySettingPrivacyAgreementView.build()
            .environmentObject(appGlobalState)
    }
}
