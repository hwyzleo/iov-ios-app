//
//  MyView_Login.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/12/13.
//

import SwiftUI

struct MyView_Login: View {
    
    var container: MviContainer<MyIntentProtocol, MyModelStateProtocol>
    private var intent: MyIntentProtocol { container.intent }
    private var state: MyModelStateProtocol { container.model }
    var user: User
    
    var body: some View {
        NavigationView {
            VStack {
                TopBar()
                MyContent(intent: intent, user: user)
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

private extension MyView_Login {
    
    // MARK: - 我的页面
    
    private struct MyContent: View {
        
        let intent: MyIntentProtocol
        let user: User
        
        var body: some View {
            ZStack(alignment: .top) {
                VStack {
                    MyAvatar(title: user.nickname, avatar: user.avatar) {
                        intent.onTapProfile()
                    }
                    VStack {
                        TitleList(title: "我的积分", iconName: "circle.square.fill")
                        TitleList(title: "我的订单", iconName: "bag.fill")
                    }
                    Spacer()
                        .frame(height: 20)
                    VStack {
                        TitleList(title: "设置", iconName: "gearshape.fill")
                        TitleList(title: "退出") {
                            intent.onTapLogout()
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
}

struct MyView_Login_Previews: PreviewProvider {
    static var previews: some View {
        MyView_Login(container: MyView.buildContainer(), user: User.getMockUser())
    }
}
