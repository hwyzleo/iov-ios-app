//
//  RouterScreenProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

protocol RouterScreenProtocol: RouterNavigationViewScreenProtocol & RouterNavigationStackScreenProtocol & RouterSheetScreenProtocol {
    var routeType: RouterScreenPresentationType { get }
}

enum RouterScreenPresentationType {
    case sheet
    case fullScreenCover
    case navigationLink

    // To make it work, you have to use NavigationStack
    case navigationDestination
}

