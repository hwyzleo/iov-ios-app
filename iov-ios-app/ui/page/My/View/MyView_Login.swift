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
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                LoadingTip()
            case .content:
                Content(intent: intent)
            case let .error(text):
                ErrorTip(text: text)
            }
        }
        .modifier(MyRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

// MARK: - Views

private extension MyView_Login {
    
    private struct Content: View {
        
        let intent: MyIntentProtocol
        @State private var nickname = "昵称"
        @State private var avatar = ""
        
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
                            intent.onTapProfile()
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
                        self.intent.onTapLogin()
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
                            intent.onTapMyArticle()
                        }
                        TitleList(title: "我的积分", iconName: "diamond") {
                            intent.onTapMyPoints()
                        }
                        TitleList(title: "我的权益", iconName: "medal") {
                            intent.onTapMyRights()
                        }
                        TitleList(title: "我的订单", iconName: "order") {
                            intent.onTapMyOrder()
                        }
                        TitleList(title: "邀请好友", iconName: "invite") {
                            intent.onTapMyInvite()
                        }
                        TitleList(title: "试驾报告", iconName: "file") {
                            intent.onTapTestDriveReport()
                        }
                        TitleList(title: "我的家充桩", iconName: "chargingPile") {
                            intent.onTapChargingPile()
                        }
                    }
                }
                .padding(20)
            }
            .edgesIgnoringSafeArea(.top)
            .onAppear(perform: {
                if let nickname = User.getUser()?.nickname {
                    self.nickname = nickname
                }
                if let avatar = User.getUser()?.avatar {
                    self.avatar = avatar
                }
            })
        }
    }
    
}

struct MyView_Login_Previews: PreviewProvider {
    static var previews: some View {
        MyView_Login(container: MyView.buildContainer())
    }
}
