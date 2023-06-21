//
//  LoginView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/13.
//

import SwiftUI

enum CountryRegion: String, CaseIterable, Identifiable {
    case ChineseMainland = "中国大陆"
    case ChineseHongKong = "中国香港"
    case ChineseMacau = "中国澳门"
    case ChineseTaiwan = "中国台湾"
    var id: String { self.rawValue }
    var code: String {
        switch self {
        case .ChineseMainland: return "+86"
        case .ChineseHongKong: return "+852"
        case .ChineseMacau: return "+853"
        case .ChineseTaiwan: return "+886"
        }
    }
}

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
                    ErrorContent(text: text)
                case .login:
                    Text("")
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
    
    private struct InputMobile: View {
        
        let intent: LoginIntentProtocol
        @State var selectedCountryRegion: CountryRegion = .ChineseMainland
        @State var mobile = ""
        
        var body: some View {
            VStack(alignment: .leading){
                Text("请输入手机号")
                    .padding(25)
                    .font(.system(size: 24))
                HStack {
                    Picker("", selection: $selectedCountryRegion) {
                        ForEach(CountryRegion.allCases) { countryRegion in
                            Text(countryRegion.rawValue).tag(countryRegion)
                        }
                    }.padding(0)
                    TextField("请输入手机号", text: $mobile)
                }
                .padding()
                HStack(alignment: .center) {
                    Spacer()
                    Button("获取验证码") {
                        intent.sendVerifyCode(
                            countryRegionCode: selectedCountryRegion.code,
                            mobile: mobile
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
    
    private struct InputVerifyCode: View {
        
        let state: LoginModelStateProtocol
        let intent: LoginIntentProtocol
        @State var verifyCode: String = ""
        
        var body: some View {
            VStack {
                HStack {
                    Text("验证码")
                    TextField("请输入验证码", text: $verifyCode)
                }
                .padding()
                HStack(alignment: .center) {
                    Spacer()
                    Button("登录") {
                        intent.verifyCodeLogin(
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
    
    private struct ErrorContent: View {
        let text: String

        var body: some View {
            ZStack {
                Color.white
                Text(text)
            }
        }
    }
    
}

#if DEBUG
// MARK: - Previews
struct LoginView_Previews: PreviewProvider {
    @State static var selectedCountryRegion: CountryRegion = .ChineseMainland
    @State static var mobile: String = ""
    static var previews: some View {
        LoginView.build()
    }
}
#endif
