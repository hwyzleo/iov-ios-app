//
//  MySettingView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

struct MySettingView: View {
    
    @StateObject var container: MviContainer<MySettingIntentProtocol, MySettingModelStateProtocol>
    private var intent: MySettingIntentProtocol { container.intent }
    private var state: MySettingModelStateProtocol { container.model }
    
    var body: some View {
        NavigationStack {
            MySettingTopBar(intent: intent)
            if(User.isLogin()) {
                MySettingView_Login(container: container, user: User.getUser()!)
            } else {
                MySettingView_NotLogin(container: container)
            }
        }
    }
    
}

// MARK: - 顶部条

struct MySettingTopBar: View {
    
    let intent: MySettingIntentProtocol
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    intent.onTapBack()
                }) {
                    Image("back")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .leading)
                        .padding(.leading, 20)
                }
                .buttonStyle(.plain)
                Spacer()
            }
            HStack {
                Text("设置")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .bold()
            }
        }
        
        VStack(alignment: .trailing) {
            HStack {
            }
            .padding(.trailing, 20)
        }
    }
}
