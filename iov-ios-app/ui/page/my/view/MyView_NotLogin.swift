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
                MyTopBar(intent: intent)
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
                ScrollView {
                    VStack {
                        Button(action: {
                            self.intent.onTapLogin()
                        }) {
                            VStack(alignment: .center) {
                                HStack {
                                    Text("Hi，\n欢迎您的到来")
                                        .font(.system(size: 22))
                                        .lineLimit(2)
                                        .frame(height: 60)
                                    Spacer()
                                    Image("myPlaceHolder")
                                }
                                .padding(.bottom, 20)
                                Button("登录 / 注册") {
                                    self.intent.onTapLogin()
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
                            .padding(.bottom, 50)
                        }
                        .buttonStyle(.plain)
                        VStack {
                            TitleList(title: "我的作品", iconName: "article")
                            TitleList(title: "我的积分", iconName: "diamond")
                            TitleList(title: "我的权益", iconName: "medal")
                            TitleList(title: "我的订单", iconName: "order")
                            TitleList(title: "邀请好友", iconName: "invite")
                            TitleList(title: "试驾报告", iconName: "file")
                            TitleList(title: "我的家充桩", iconName: "chargingPile")
                        }
                        Spacer()
                            .frame(height: 20)
                    }
                    .padding(20)
                }
                .edgesIgnoringSafeArea(.top)
            }
        }
    }
    
}

struct MyView_NotLogin_Previews: PreviewProvider {
    static var previews: some View {
        MyView_NotLogin(container: MyView.buildContainer())
    }
}
