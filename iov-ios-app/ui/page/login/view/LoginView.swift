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
                    InputMobile(intent: intent)
                case .inputVerifyCode:
                    InputVerifyCode(state: state, intent: intent)
                case let .error(text):
                    InputMobile(intent: intent)
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

private extension LoginView {
    
    private struct LoadingContent: View {
        var body: some View {
            ZStack {
                Color.white
                Text("请求中")
            }
        }
    }
    
    // MARK: - 输入手机号
    
    private struct InputMobile: View {
        
        let intent: LoginIntentProtocol
        @State var mobile = ""
        @State var agree = false
        @State var showAgreeAlert = false
        @State var showMobileAlert = false
        
        var agreement: AttributedString {
            var agreement = AttributedString("我已阅读并同意《用户协议》《隐私政策》，用户首次登录将会同步注册APP账号")
            let prot = agreement.range(of: "《用户协议》")
            agreement[prot!].link = URL(string: "https://www.baidu.com")
            let priv = agreement.range(of: "《隐私政策》")
            agreement[priv!].link = URL(string: "https://www.baidu.com")
            return agreement;
        }
        
        var body: some View {
            VStack(alignment: .leading) {
                LoginView.TopBar(intent: intent)
                Text("请输入手机号")
                    .padding(25)
                    .font(.system(size: 24))
                    .foregroundColor(Theme.mainColor.textColor)
                HStack {
                    Text("+86")
                        .foregroundColor(Color(hex: 0x333333))
                        .font(.system(size: 20))
                    Divider()
                        .frame(height: 30)
                        .background(Color(hex: 0x333333))
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                    TextField("请输入手机号", text: $mobile)
                        .foregroundColor(Color(hex: 0x333333))
                        .font(.system(size: 18))
                        .keyboardType(.phonePad)
                        .modifier(ClearButton(text: $mobile))
                }
                .padding(.top, 5)
                .padding(.leading, 25)
                .padding(.trailing, 25)
                .padding(.bottom, 10)
                HStack(alignment: .center) {
                    Spacer()
                    Button("获取验证码") {
                        if !agree {
                            self.showAgreeAlert = true
                            return
                        }
                        if mobile.isEmpty {
                            self.showMobileAlert = true
                            return
                        }
                        intent.onTapSendVerifyCodeButton(
                            countryRegionCode: "+86",
                            mobile: mobile
                        )
                    }
                    .padding(10)
                    .frame(width: 300)
                    .foregroundColor(Color.white)
                    .background(mobile.isEmpty ? Color.gray : Color.black)
                    .cornerRadius(22.5)
                    .alert(Text("提示"), isPresented: $showAgreeAlert) {
                        Button("取消", role: .cancel) { }
                        Button("确认") {}
                    } message: {
                        Text("请勾选同意用户协议")
                    }
                    .alert(Text("提示"), isPresented: $showMobileAlert) {
                        Button("取消", role: .cancel) { }
                        Button("确认") {}
                    } message: {
                        Text("请输入手机号")
                    }
                    Spacer()
                }
                HStack(alignment: .top) {
                    Button(action: {
                        self.agree.toggle()
                    }) {
                        if agree {
                            Image("red_select")
                            .resizable()
                            .frame(width: 12, height: 12)
                        } else {
                            Image("black_unSelect")
                            .resizable()
                            .frame(width: 12, height: 12)
                        }
                    }
                    Text(agreement)
                    .font(.system(size: 10))
                    .lineSpacing(4)
                }
                .padding(.top, 15)
                .padding(.leading, 25)
                .padding(.trailing, 25)
                Spacer()
            }
        }
    
    }
    
    private struct InputVerifyCode: View {
        
        let state: LoginModelStateProtocol
        let intent: LoginIntentProtocol
        @State var verifyCode: String = ""
        
        var body: some View {
            VStack {
                LoginView.TopBar(intent: intent)
                HStack {
                    Text("验证码")
                    TextField("请输入验证码", text: $verifyCode)
                }
                .padding()
                HStack(alignment: .center) {
                    Spacer()
                    Button("登录") {
                        intent.onTapVerifyCodeLoginButton(
                            countryRegionCode: state.countryRegionCode,
                            mobile: state.mobile,
                            verifyCode: verifyCode
                        )
                    }
                    .padding(10)
                    .frame(width: 300)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(5)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    // MARK: - 顶部条
    
    private struct TopBar: View {
        let intent: LoginIntentProtocol
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        intent.onTapBackIcon()
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
        LoginView.build()
    }
}
#endif
