//
//  MySettingView+Build.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

extension TestDriveReportView {
    
    static func buildContainer() -> some MviContainer<TestDriveReportIntentProtocol, TestDriveReportModelStateProtocol> {
        let model = TestDriveReportModel()
        let intent = TestDriveReportIntent(model: model)
        let container = MviContainer(
            intent: intent as TestDriveReportIntentProtocol,
            model: model as TestDriveReportModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return container
    }
    
    static func build() -> some View {
        return TestDriveReportView(container: buildContainer())
    }
    
}
