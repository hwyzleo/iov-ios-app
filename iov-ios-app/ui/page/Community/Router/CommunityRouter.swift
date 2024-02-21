//
//  CommunityRouter.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/22.
//

import SwiftUI

struct CommunityRouter: RouterProtocol {
    typealias RouterScreenType = ScreenType
    typealias RouterAlertType = AlertScreen

    let subjects: Subjects
    let intent: CommunityIntentProtocol
}

// MARK: - Navigation Screens

extension CommunityRouter {
    enum ScreenType: RouterScreenProtocol {
        case product

        var routeType: RouterScreenPresentationType {
            switch self {
            case .product:
                return .navigationLink
            }
        }
    }

    @ViewBuilder
    func makeScreen(type: RouterScreenType) -> some View {
        switch type {
        case .product:
            ProductView.build()
                .navigationBarHidden(true)
        }
    }

    func onDismiss(screenType: RouterScreenType) {}
}

// MARK: - Alerts

extension CommunityRouter {
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
