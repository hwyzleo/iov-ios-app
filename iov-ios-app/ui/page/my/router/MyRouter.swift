//
//  MyRouter.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/22.
//

import SwiftUI

struct MyRouter: RouterProtocol {
    typealias RouterScreenType = ScreenType
    typealias RouterAlertType = AlertScreen

    let subjects: Subjects
    let intent: MyIntentProtocol
}

// MARK: - Navigation Screens

extension MyRouter {
    enum ScreenType: RouterScreenProtocol {
        case login
        case profile

        var routeType: RouterScreenPresentationType {
            switch self {
            case .login:
                return .fullScreenCover
            case .profile:
                return .navigationLink
            }
        }
    }

    @ViewBuilder
    func makeScreen(type: RouterScreenType) -> some View {
        switch type {
        case .login:
            LoginView.build()
        case .profile:
            ProfileView.build()
                .navigationBarHidden(true)
        }
    }

    func onDismiss(screenType: RouterScreenType) {}
}

// MARK: - Alerts

extension MyRouter {
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
