//
//  MySettingModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import Foundation

// MARK: - View State

protocol TestDriveReportModelStateProtocol {
    var contentState: TestDriveReportTypes.Model.ContentState { get }
    var routerSubject: TestDriveReportRouter.Subjects { get }
}

// MARK: - Intent Action

protocol TestDriveReportModelActionProtocol: MviModelActionProtocol {
}

// MARK: - Route

protocol TestDriveReportModelRouterProtocol: MviModelRouterProtocol {
}
