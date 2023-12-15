//
//  LoginModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class LoginModel: ObservableObject, LoginModelStateProtocol {
    @Published var contentState: LoginTypes.Model.ContentState = .inputMobile
    var countryRegionCode: String = "+86"
    var mobile: String = ""
    let routerSubject = LoginRouter.Subjects()
}

// MARK: - Action Protocol

extension LoginModel: LoginModelActionProtocol {
    func displayLoading() {
        contentState = .loading
    }
    func toggleAgreement() {
        
    }
    func routeInputVerify(countryRegionCode: String, mobile: String) {
        self.countryRegionCode = countryRegionCode
        self.mobile = mobile
        contentState = .inputVerifyCode
    }
    func displayError(text: String) {
        contentState = .error(text: text)
        
    }
}

// MARK: - Router Protocol

extension LoginModel: LoginModelRouterProtocol {
    func close() {
        routerSubject.close.send()
    }
}

extension LoginTypes.Model {
    enum ContentState {
        case loading
        case inputMobile
        case inputVerifyCode
        case error(text: String)
    }
}
