//
//  ProductRouter.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/22.
//

import SwiftUI

struct ProductRouter: RouterProtocol {
    typealias RouterScreenType = ScreenType
    typealias RouterAlertType = AlertScreen

    let subjects: Subjects
    let intent: ProductIntentProtocol
}

// MARK: - Navigation Screens

extension ProductRouter {
    enum ScreenType: RouterScreenProtocol {
        case login
        case orderConfirm

        var routeType: RouterScreenPresentationType {
            switch self {
            case .login:
                return .navigationLink
            case .orderConfirm:
                return .navigationLink
            }
        }
    }

    @ViewBuilder
    func makeScreen(type: RouterScreenType) -> some View {
        switch type {
        case .login:
            LoginView.buildMobileLogin()
                .navigationBarHidden(true)
        case .orderConfirm:
            OrderConfirmView.build()
                .navigationBarHidden(true)
        }
    }

    func onDismiss(screenType: RouterScreenType) {}
}

// MARK: - Alerts

extension ProductRouter {
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
