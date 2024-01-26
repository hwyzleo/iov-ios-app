//
//  MyView_NotLogin.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/12/13.
//

import SwiftUI
import SwiftyJSON
import MBProgressHUD

struct MyView_NotLogin: View {
    
    var container: MviContainer<MyIntentProtocol, MyModelStateProtocol>
    private var intent: MyIntentProtocol { container.intent }
    private var state: MyModelStateProtocol { container.model }
    
    var body: some View {
        NavigationView {
            VStack {
                TopBar()
                MyContent(intent: intent)
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

private extension MyView_NotLogin {
    
    // MARK: - 我的页面
    
    private struct MyContent: View {
        
        let intent: MyIntentProtocol
        
        var body: some View {
            ZStack(alignment: .top) {
                VStack {
                    MyAvatar(title: "注册 / 登录", avatar: "") {
                        intent.onTapLogin()
                    }
                    VStack {
                        TitleList(title: "我的积分", iconName: "circle.square.fill")
                        TitleList(title: "我的订单", iconName: "bag.fill")
                    }
                    Spacer()
                        .frame(height: 20)
                    VStack {
                        TitleList(title: "设置", iconName: "gearshape.fill")
                    }
                    Spacer()
                }
            }
        }
    }
    
}

struct MyView_NotLogin_Previews: PreviewProvider {
    static var previews: some View {
        MyView_NotLogin(container: MyView.buildContainer())
    }
}
