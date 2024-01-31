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
        NavigationView {
            VStack {
                MyTopBar(intent: intent)
                MyContent(intent: intent)
                Spacer()
            }
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
        @State private var nickname = ""
        @State private var avatar = ""
        
        var body: some View {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack {
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
                                        Image("myPlaceHolder")
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
                        }
                        .padding(.bottom, 50)
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
                    }
                    .padding(20)
                }
                .edgesIgnoringSafeArea(.top)
            }
            .onAppear(perform: {
                nickname = User.getUser()?.nickname ?? ""
                avatar = User.getUser()?.avatar ?? ""
            })
        }
    }
    
}

struct MyView_Login_Previews: PreviewProvider {
    static var previews: some View {
        MyView_Login(container: MyView.buildContainer())
    }
}
