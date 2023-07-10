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
            VStack {
                switch state.contentState {
                case .content:
                    MyContent(intent: intent)
                case let .error(text):
                    ErrorContent(text: text)
                }
                Spacer()
            }
            .onAppear(perform: intent.viewOnAppear)
            .modifier(MyRouter(
                subjects: state.routerSubject,
                intent: intent
            ))
        }
    }
}

// MARK: - Views

private extension MyView {
    
    // MARK: - 我的页面
    
    private struct MyContent: View {
        
        @AppStorage("userLogin") private var userLogin: Bool = false
        @AppStorage("userNickname") private var userNickname: String = ""
        @AppStorage("userAvatar") private var userAvatar: String = ""
        let intent: MyIntentProtocol
        
        var body: some View {
            ZStack(alignment: .top) {
                VStack {
                    if(!userLogin) {
                        MyView.MyAvatar(title: "注册 / 登录") {
                            intent.onTapLogin()
                        }
                    } else {
                        MyView.MyAvatar(title: userNickname) {
                            intent.onTapProfile()
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
                                self.userAvatar = ""
                            }
                        }
                    }
                    Spacer()
                }
                MyView.TopBar()
            }
        }
    }
    
    // MARK: - 顶部条
    
    private struct TopBar: View {
        var body: some View {
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "qrcode")
                            .padding(.trailing, 20)
                    }
                    .foregroundColor(.black)
                    Button(action: {
                        
                    }) {
                        Image(systemName: "ellipsis.viewfinder")
                            .padding(.trailing, 30)
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
    
    // MARK: - 头像
    
    struct MyAvatar: View {
        var title: String
        var action: (() -> Void)?
        @AppStorage("userAvatar") private var userAvatar: String = ""
        var body: some View {
            Button(action: { action?() }) {
                VStack {
                    if userAvatar.count > 0 {
                        AsyncImage(url: URL(string: userAvatar)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.white
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, 80)
                    } else {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .padding(.top, 80)
                    }
                    Text(title)
                        .padding()
                        .font(.system(size: 20))
                    Spacer()
                        .frame(height: 20)
                }.foregroundColor(.black)
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

struct MyView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        MyView.build()
    }
}
