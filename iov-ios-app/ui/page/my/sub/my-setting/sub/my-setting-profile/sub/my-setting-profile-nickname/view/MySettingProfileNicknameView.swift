//
//  MySettingProfileNicknameView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

struct MySettingProfileNicknameView: View {
    
    @StateObject var container: MviContainer<MySettingProfileNicknameIntentProtocol, MySettingProfileNicknameModelStateProtocol>
    private var intent: MySettingProfileNicknameIntentProtocol { container.intent }
    private var state: MySettingProfileNicknameModelStateProtocol { container.model }
    @State var nickname: String = ""
    @EnvironmentObject var appGlobalState: AppGlobalState
    
    var body: some View {
        ZStack {
            VStack {
                TopBackTitleBar(title: "昵称") {
                    intent.onTapBackProfile()
                }
                VStack(alignment: .leading) {
                    TextField("", text: $nickname)
                        .frame(height: 35)
                        .textFieldStyle(.plain)
                        .onChange(of: nickname) { newNickname in
                            if(newNickname.count > 15) {
                                nickname = String(newNickname.prefix(15))
                            }
                        }
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 0.5)
                    Text("昵称最多15个字符")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .padding(.top, 10)
                    Button("保存") {
                        intent.onTapNicknameSaveButton(nickname: nickname)
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(22.5)
                    .padding(.top, 20)
                    .contentShape(Rectangle())
                    Spacer()
                }
                .padding(20)
            }
        }
        .onAppear(perform: {
            if(User.isLogin()) {
                nickname = User.getUser()!.nickname
            }
            appGlobalState.currentView = "MySettingProfileNickname"
        })
        .modifier(MySettingProfileNicknameRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

struct MySettingProfileNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        MySettingProfileNicknameView(container: MySettingProfileNicknameView.buildContainer())
    }
}
