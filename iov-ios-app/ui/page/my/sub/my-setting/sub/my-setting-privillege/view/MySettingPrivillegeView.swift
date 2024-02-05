//
//  ProfileView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import SwiftUI

struct MySettingPrivillegeView: View {
    @StateObject var container: MviContainer<MySettingPrivillegeIntentProtocol, MySettingPrivillegeModelStateProtocol>
    private var intent: MySettingPrivillegeIntentProtocol { container.intent }
    private var state: MySettingPrivillegeModelStateProtocol { container.model }
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                LoadingTip()
            case .content:
                Content(intent: intent, state: state)
            case let .error(text):
                ErrorTip(text: text)
            }
        }
        .onAppear(perform: intent.viewOnAppear)
        .modifier(MySettingPrivillegeRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

// MARK: - Views

private extension MySettingPrivillegeView {
    
    private struct Content: View {
        let intent: MySettingPrivillegeIntentProtocol
        let state: MySettingPrivillegeModelStateProtocol
        @EnvironmentObject var appGlobalState: AppGlobalState
        @State private var isToggleOn = false
        
        var body: some View {
            VStack {
                TopBackTitleBar(title: "权限管理")
                Spacer()
                    .frame(height: 20)
                VStack {
                    Text("为了更好的使用体验，在特定场景会向您申请以下手机系统权限。")
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                        .padding(10)
                }
                .background(Color(hex: 0xf2eded))
                VStack {
                    ContentList(title: "网络", content: "已授权") {
                        
                    }
                    ContentList(title: "位置", content: "已授权") {
                        
                    }
                    ContentList(title: "相册", content: "已授权") {
                        
                    }
                    ContentList(title: "相机", content: "已授权") {
                        
                    }
                    ContentList(title: "通知", content: "已授权") {
                        
                    }
                    ContentList(title: "隐私政策", content: "已同意") {
                        
                    }
                }
                Spacer()
            }
            .onAppear {
                appGlobalState.currentView = "MySettingPrivillege"
            }
        }
    }
    
}


struct MySettingPrivillegeView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        MySettingPrivillegeView(container: MySettingPrivillegeView.buildContainer())
            .environmentObject(appGlobalState)
    }
}
