//
//  LoginView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/13.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var container: MviContainer<LoginIntentProtocol, LoginModelStateProtocol>
    private var intent: LoginIntentProtocol { container.intent }
    private var state: LoginModelStateProtocol { container.model }
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                switch state.contentState {
                case .loading:
                    LoadingContent()
                case .inputMobile:
                    MobileLogin(state: state, intent: intent)
                case .inputVerifyCode:
                    MobileVerifyCode(state: state, intent: intent)
                case let .error(text):
                    MobileLogin(state: state, intent: intent)
                    ErrorTip(text: text)
                }
            }
            .modifier(
                LoginRouter(
                    subjects: state.routerSubject,
                    intent: intent
                )
            )
        }
    }
    
}

// MARK: - Views

extension LoginView {
    
    struct LoadingContent: View {
        var body: some View {
            ZStack {
                Color.white
                Text("请求中")
            }
        }
    }
    
    // MARK: - 顶部条
    
    struct TopBar: View {
        let intent: LoginIntentProtocol
        var backAction: () -> Void
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        backAction()
                    }) {
                        Image(systemName: "chevron.backward")
                            .padding(.leading, 20)
                    }
                    .foregroundColor(.black)
                    Spacer()
                }
            }
        }
    }
    
}

#if DEBUG
// MARK: - Previews
struct LoginView_Previews: PreviewProvider {
    @State static var mobile: String = ""
    static var previews: some View {
        LoginView.buildMobileLogin()
    }
}
#endif
