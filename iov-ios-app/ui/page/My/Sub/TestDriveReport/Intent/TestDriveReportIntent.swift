//
//  MySettingIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

class TestDriveReportIntent: MviIntentProtocol {
    private weak var modelAction: TestDriveReportModelActionProtocol?
    private weak var modelRouter: TestDriveReportModelRouterProtocol?
    
    init(model: TestDriveReportModelActionProtocol & TestDriveReportModelRouterProtocol) {
        self.modelAction = model
        self.modelRouter = model
    }
    
    func viewOnAppear() {}
}

extension TestDriveReportIntent: TestDriveReportIntentProtocol {
}

