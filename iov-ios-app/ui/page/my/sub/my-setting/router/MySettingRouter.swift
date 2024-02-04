//
//  MySettingRouter.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

struct MySettingRouter: RouterProtocol {
    typealias RouterScreenType = ScreenType
    typealias RouterAlertType = AlertScreen

    let subjects: Subjects
    let intent: MySettingIntentProtocol
}

// MARK: - Navigation Screens

extension MySettingRouter {
    enum ScreenType: RouterScreenProtocol {
        case login
        case my
        case profile
        case setting

        var routeType: RouterScreenPresentationType {
            switch self {
            case .login:
                return .fullScreenCover
            case .my:
                return .navigationLink
            case .profile:
                return .navigationLink
            case .setting:
                return .navigationLink
            }
        }
    }

    @ViewBuilder
    func makeScreen(type: RouterScreenType) -> some View {
        switch type {
        case .login:
            LoginView.buildMobileLogin()
        case .my:
            MyView.build()
                .navigationBarHidden(true)
        case .profile:
            MySettingProfileView.build()
                .navigationBarHidden(true)
        case .setting:
            MySettingView.build()
                .navigationBarHidden(true)
        }
    }

    func onDismiss(screenType: RouterScreenType) {}
}

// MARK: - Alerts

extension MySettingRouter {
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
