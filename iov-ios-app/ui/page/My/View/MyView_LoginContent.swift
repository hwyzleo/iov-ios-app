//
//  MyView_Login.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/12/13.
//

import SwiftUI

extension MyView {
    struct LoginContent: View {
        var nickname = "昵称"
        var avatar = ""
        var tapLoginAction: (() -> Void)?
        var tapUserAction: (() -> Void)?
        var tapArticleAction: (() -> Void)?
        var tapPointsAction: (() -> Void)?
        var tapRightsAction: (() -> Void)?
        var tapOrderAction: (() -> Void)?
        var tapInviteAction: (() -> Void)?
        var tapTestDriveReportAction: (() -> Void)?
        var tapChargingPileAction: (() -> Void)?
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text(nickname)
                            .font(.system(size: 22))
                            .lineLimit(2)
                            .frame(height: 60)
                        Spacer()
                        Button(action: {
                            tapUserAction?()
                        }) {
                            if !avatar.isEmpty {
                                AsyncImage(url: URL(string: avatar)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.white
                                }
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .aspectRatio(contentMode: .fit)
                            } else {
                                Image("MyPlaceHolder")
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.bottom, 10)
                    Button("签到") {
                        tapLoginAction?()
                    }
                    .font(.system(size: 15))
                    .padding(5)
                    .frame(width: 100)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .scaleEffect(1)
                    Spacer()
                        .frame(height: 50)
                    VStack {
                        TitleList(title: "我的作品", iconName: "article") {
                            tapArticleAction?()
                        }
                        TitleList(title: "我的积分", iconName: "diamond") {
                            tapPointsAction?()
                        }
                        TitleList(title: "我的权益", iconName: "medal") {
                            tapRightsAction?()
                        }
                        TitleList(title: "我的订单", iconName: "order") {
                            tapOrderAction?()
                        }
                        TitleList(title: "邀请好友", iconName: "invite") {
                            tapInviteAction?()
                        }
                        TitleList(title: "试驾报告", iconName: "file") {
                            tapTestDriveReportAction?()
                        }
                        TitleList(title: "我的家充桩", iconName: "chargingPile") {
                            tapChargingPileAction?()
                        }
                    }
                }
                .padding(20)
            }
            .edgesIgnoringSafeArea(.top)
//            .onAppear(perform: {
//                if let nickname = User.getUser()?.nickname {
//                    self.nickname = nickname
//                }
//                if let avatar = User.getUser()?.avatar {
//                    self.avatar = avatar
//                }
//            })
        }
    }
}

struct MyView_Login_Previews: PreviewProvider {
    static var previews: some View {
        MyView.LoginContent()
    }
}
