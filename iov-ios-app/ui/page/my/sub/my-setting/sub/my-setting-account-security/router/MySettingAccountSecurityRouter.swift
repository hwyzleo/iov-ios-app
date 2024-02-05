//
//  ProfileRouter.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

struct MySettingAccountSecurityRouter: RouterProtocol {
    typealias RouterScreenType = ScreenType
    typealias RouterAlertType = AlertScreen

    let subjects: Subjects
    let intent: MySettingAccountSecurityIntentProtocol
}

// MARK: - Navigation Screens

extension MySettingAccountSecurityRouter {
    enum ScreenType: RouterScreenProtocol {
        case login
        case nickname
        case gender
        case area

        var routeType: RouterScreenPresentationType {
            switch self {
            case .login:
                return .fullScreenCover
            case .nickname:
                return .navigationLink
            case .gender:
                return .navigationLink
            case .area:
                return .navigationLink
            }
        }
    }

    @ViewBuilder
    func makeScreen(type: RouterScreenType) -> some View {
        switch type {
        case .login:
            LoginView.buildMobileLogin()
        case .nickname:
            MySettingProfileNicknameView.build()
                .navigationBarHidden(true)
        case .gender:
            MySettingProfileGenderView.build()
                .navigationBarHidden(true)
        case .area:
            MySettingProfileAreaView.build()
                .navigationBarHidden(true)
        }
    }

    func onDismiss(screenType: RouterScreenType) {}
}

// MARK: - Alerts

extension MySettingAccountSecurityRouter {
    enum AlertScreen: RouterAlertScreenProtocol {
        case defaultAlert(title: String, message: String?)
    }

    func makeAlert(type: RouterAlertType) -> Alert {
        switch type {
        case let .defaultAlert(title, message):
            return Alert(title: Text(title),
                         message: message.map { Text($0) },
                         dismissButton: .cancel(Text("Cancel")))
        }
    }
}
