//
//  MySettingView_NotLogin.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI
import SwiftyJSON
import MBProgressHUD

struct MySettingView_NotLogin: View {
    
    var container: MviContainer<MySettingIntentProtocol, MySettingModelStateProtocol>
    private var intent: MySettingIntentProtocol { container.intent }
    private var state: MySettingModelStateProtocol { container.model }
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                LoadingTip()
            case .content:
                Content(intent: intent)
            case let .error(text):
                ErrorTip(text: text)
            }
        }
        .onAppear(perform: intent.viewOnAppear)
        .modifier(MySettingRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

// MARK: - Views

private extension MySettingView_NotLogin {
    
    private struct Content: View {
        
        let intent: MySettingIntentProtocol
        
        var body: some View {
            ScrollView {
                VStack {
                    TitleList(title: "个人资料") {
                        intent.onTapLogin()
                    }
                    TitleList(title: "主使用人变更") {
                        intent.onTapLogin()
                    }
                    TitleList(title: "账号安全") {
                        intent.onTapLogin()
                    }
                    TitleList(title: "账号绑定") {
                        intent.onTapLogin()
                    }
                    TitleList(title: "权限管理") {
                        intent.onTapPrivillege()
                    }
                    TitleList(title: "用户协议") {
                        intent.onTapUserProtocol()
                    }
                    TitleList(title: "社区公约") {
                        intent.onTapCommunityConvention()
                    }
                    TitleList(title: "隐私协议") {
                        intent.onTapPrivacyAgreement()
                    }
                }
                .padding(20)
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
    
}

struct MySettingView_NotLogin_Previews: PreviewProvider {
    static var previews: some View {
        MySettingView_NotLogin(container: MySettingView.buildContainer())
    }
}
