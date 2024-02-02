//
//  MySettingView_Login.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

struct MySettingView_Login: View {
    
    var container: MviContainer<MySettingIntentProtocol, MySettingModelStateProtocol>
    private var intent: MySettingIntentProtocol { container.intent }
    private var state: MySettingModelStateProtocol { container.model }
    var user: User
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                LoadingTip()
            case .content:
                Content(intent: intent, user: user)
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

private extension MySettingView_Login {
    
    private struct Content: View {
        
        let intent: MySettingIntentProtocol
        let user: User
        @State private var showAlert = false
        
        var body: some View {
            ScrollView {
                VStack {
                    TitleList(title: "个人资料", action: {
                        intent.onTapProfile()
                    })
                    TitleList(title: "主使用人变更")
                    TitleList(title: "账号安全")
                    TitleList(title: "账号绑定")
                    TitleList(title: "权限管理")
                    TitleList(title: "用户协议")
                    TitleList(title: "社区公约")
                    TitleList(title: "隐私协议")
                    Spacer()
                        .frame(height: 40)
                    Button("退出登录") {
                        showAlert = true
                    }
                    .font(.system(size: 15))
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .scaleEffect(1)
                }
                .padding(20)
                .alert(Text("提示"), isPresented: $showAlert) {
                    Button("取消", role: .cancel) { }
                    Button("确认") {
                        self.intent.onTapLogout()
                    }
                } message: {
                    Text("您确定登出？")
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
    
}

struct MySettingView_Login_Previews: PreviewProvider {
    static var previews: some View {
        MySettingView_Login(container: MySettingView.buildContainer(), user: User.getMockUser())
    }
}
