//
//  CommunityTopicRouter.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/1.
//

import SwiftUI

struct CommunityTopicRouter: RouterProtocol {
    typealias RouterScreenType = ScreenType
    typealias RouterAlertType = AlertScreen

    let subjects: Subjects
    let intent: CommunityTopicIntentProtocol
}

// MARK: - Navigation Screens

extension CommunityTopicRouter {
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

extension CommunityTopicRouter {
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
