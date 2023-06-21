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
        NavigationView {
            ZStack {
                switch state.contentState {
                case .content:
                    MyItem()
                case let .error(text):
                    ErrorContent(text: text)
                }
            }
            .onAppear(perform: intent.viewOnAppear)
        }
    }
}

// MARK: - Views

private extension MyView {
    
    // MARK: - Loading View
    
    private struct LoadingContent: View {
        let text: String

        var body: some View {
            ZStack {
                Color.white
                Text(text)
            }
        }
    }
    
    // MARK: - MyItem View
    
    private struct MyItem: View {
        
        @AppStorage("userLogin") private var userLogin: Bool = false
        @AppStorage("userNickname") private var userNickname: String = ""
        
        var body: some View {
            VStack {
                if(!userLogin) {
                    NavigationLink(destination: LoginView.build) {
                        MyAvatar(title: "注册 / 登录")
                    }
                } else {
                    NavigationLink(destination: ProfileView.build) {
                        MyAvatar(title: userNickname)
                    }
                }
                VStack {
                    TitleList(title: "我的积分", iconName: "circle.square.fill")
                    TitleList(title: "我的订单", iconName: "bag.fill")
                }
                Spacer()
                    .frame(height: 20)
                VStack {
                    TitleList(title: "设置", iconName: "gearshape.fill")
                    if(userLogin) {
                        TitleList(title: "退出") {
                            self.userLogin.toggle()
                            self.userNickname = ""
                        }
                    }
                }
                Spacer()
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
    
}

struct MyAvatar: View {
    var title: String
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(.top, 60)
            Text(title)
                .padding()
                .font(.system(size: 20))
            Spacer()
                .frame(height: 20)
        }.foregroundColor(.black)
    }
}

struct MyView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        MyView.build()
    }
}
