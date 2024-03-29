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
    @State var isLogin: Bool
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
            case .content:
                Content(intent: intent, state: state, isLogin: $isLogin)
            case let .error(text):
                ErrorTip(text: text)
            }
        }
        .onAppear {
            isLogin = User.isLogin()
        }
        .modifier(MyRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

extension MyView {
    
    struct Content: View {
        var intent: MyIntentProtocol
        var state: MyModelStateProtocol
        @Binding var isLogin: Bool
        
        var body: some View {
            if(isLogin) {
                if let user = User.getUser() {
                    MyView.LoginContent(
                        nickname: user.nickname, avatar: user.avatar,
                        tapMessageAction: { intent.onTapMessage() },
                        tapSettingAction: { intent.onTapSetting() },
                        tapUserAction: { intent.onTapProfile() },
                        tapArticleAction: { intent.onTapMyArticle() },
                        tapPointsAction: { intent.onTapMyPoints() },
                        tapRightsAction: { intent.onTapMyRights() },
                        tapOrderAction: { intent.onTapMyOrder() },
                        tapInviteAction: { intent.onTapMyInvite() },
                        tapChargingPileAction: { intent.onTapChargingPile() }
                    )
                }
            } else {
                MyView.NotLoginContent(
                    tapLoginAction: { intent.onTapLogin() },
                    tapSettingAction: { intent.onTapSetting() }
                )
            }
        }
    }
}
