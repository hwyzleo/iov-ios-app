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
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    @State var selectedCountryRegion: CountryRegion = .ChineseMainland
    @State var mobile: String = ""
    
    var body: some View {
        if !viewModel.viewState.isSendVerifyCode {
            LoginStep1View(viewModel: viewModel, selectedCountryRegion: $selectedCountryRegion, mobile: $mobile)
        } else {
            LoginStep2View(viewModel: viewModel, selectedCountryRegion: $selectedCountryRegion, mobile: $mobile)
        }
    }
    
}

struct LoginStep1View: View {
    
    var viewModel: LoginViewModel
    @Binding var selectedCountryRegion: CountryRegion
    @Binding var mobile: String
    
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
                    viewModel.dispatch(intent: LoginIntent.SendVerifyCode(selectedCountryRegion.code, mobile))
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

struct LoginStep2View: View {
    
    var viewModel: LoginViewModel
    @Binding var selectedCountryRegion: CountryRegion
    @Binding var mobile: String
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
                    viewModel.dispatch(intent: LoginIntent.VerifyCodeLogin(selectedCountryRegion.code, mobile, verifyCode))
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

// MARK: - Views

private extension LoginView {
    
}

#if DEBUG
// MARK: - Previews
struct LoginView_Previews: PreviewProvider {
    @State static var selectedCountryRegion: CountryRegion = .ChineseMainland
    @State static var mobile: String = ""
    static var previews: some View {
        LoginStep1View(viewModel: LoginViewModel(), selectedCountryRegion: $selectedCountryRegion, mobile: $mobile)
//        LoginStep2View(viewModel: LoginViewModel(), mobile: $mobile)
    }
}
#endif
