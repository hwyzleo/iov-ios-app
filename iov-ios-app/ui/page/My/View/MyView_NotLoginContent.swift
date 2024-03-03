//
//  MyView_NotLogin.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/12/13.
//

import SwiftUI
import SwiftyJSON
import MBProgressHUD

extension MyView {
    struct NotLoginContent: View {
        var tapLoginAction: (() -> Void)?
        
        var body: some View {
            ScrollView {
                MyView.TopBar()
                VStack {
                    Button(action: {
                        tapLoginAction?()
                    }) {
                        VStack(alignment: .center) {
                            HStack {
                                Text("Hi，\n欢迎您的到来")
                                    .font(.system(size: 22))
                                    .lineLimit(2)
                                    .frame(height: 60)
                                Spacer()
                                Image("MyPlaceHolder")
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
                    }
                    .buttonStyle(.plain)
                    Spacer()
                        .frame(height: 50)
                    VStack {
                        TitleList(title: "我的作品", iconName: "article") {
                            tapLoginAction?()
                        }
                        TitleList(title: "我的积分", iconName: "diamond") {
                            tapLoginAction?()
                        }
                        TitleList(title: "我的权益", iconName: "medal") {
                            tapLoginAction?()
                        }
                        TitleList(title: "我的订单", iconName: "order") {
                            tapLoginAction?()
                        }
                        TitleList(title: "邀请好友", iconName: "invite") {
                            tapLoginAction?()
                        }
                        TitleList(title: "试驾报告", iconName: "file") {
                            tapLoginAction?()
                        }
                        TitleList(title: "我的家充桩", iconName: "chargingPile") {
                            tapLoginAction?()
                        }
                    }
                }
                .padding(20)
            }
        }
    }
}

struct MyView_NotLogin_Previews: PreviewProvider {
    static var previews: some View {
        MyView.NotLoginContent()
    }
}
