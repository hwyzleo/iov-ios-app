//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct MyView: View {
    
    @StateObject var container: MviContainer<MyIntentProtocol, MyModelStateProtocol>
    private var intent: MyIntentProtocol { container.intent }
    private var state: MyModelStateProtocol { container.model }
    
    var body: some View {
        if(User.isLogin()) {
            MyView_Login(container: container)
        } else {
            MyView_NotLogin(container: container)
        }
    }
}

// MARK: - 顶部条

struct MyTopBar: View {
    
    let intent: MyIntentProtocol
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Spacer()
                Button(action: {
                    
                }) {
                    Image("message")
                }
                .buttonStyle(.plain)
                Spacer()
                    .frame(width: 20)
                Button(action: {
                    intent.onTapSetting()
                }) {
                    Image("setting")
                }
                .buttonStyle(.plain)
            }
            .padding(.trailing, 20)
        }
    }
}

// MARK: - Error View

private struct ErrorContent: View {
    let text: String

    var body: some View {
        ZStack {
            Color.white
            Text(text)
        }
    }
}
