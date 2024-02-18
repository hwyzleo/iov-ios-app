//
//  MySettingModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

final class TestDriveReportModel: ObservableObject, TestDriveReportModelStateProtocol {
    @Published var contentState: TestDriveReportTypes.Model.ContentState = .content
    let routerSubject = TestDriveReportRouter.Subjects()
}

// MARK: - Action Protocol

extension TestDriveReportModel: TestDriveReportModelActionProtocol {
    
    func displayLoading() {}
    
}

// MARK: - Route

extension TestDriveReportModel: TestDriveReportModelRouterProtocol {
    func routeToLogin() {
        
    }
    
    func closeScreen() {
        
    }
    
}

extension TestDriveReportTypes.Model {
    enum ContentState {
        case loading
        case content
        case error(text: String)
    }
}
