//
//  LoginView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

extension LoginView {
    
    static func buildMobileLogin() -> some View {
        let model = LoginModel()
        let intent = LoginIntent(model: model)
        let container = MviContainer(
            intent: intent as LoginIntentProtocol,
            model: model as LoginModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        let view = LoginView(container: container)
        return view
    }
    
    static func buildMobileVerifyCode() -> some View {
        let model = LoginModel()
        model.mobile = "13000000000"
        model.contentState = .inputVerifyCode
        let intent = LoginIntent(model: model)
        let container = MviContainer(
            intent: intent as LoginIntentProtocol,
            model: model as LoginModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        let view = LoginView(container: container)
        return view
    }
    
}
