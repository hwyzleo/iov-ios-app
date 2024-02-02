//
//  MySettingProfileNicknameModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

final class MySettingProfileAreaModel: ObservableObject, MySettingProfileAreaModelStateProtocol {
    @Published var contentState: MySettingProfileAreaTypes.Model.ContentState = .province
    let loadingText = "Loading"
    let routerSubject = MySettingProfileAreaRouter.Subjects()
    var province: String = ""
}

// MARK: - Action Protocol

extension MySettingProfileAreaModel: MySettingProfileAreaModelActionProtocol {
    func displayLoading() {
        contentState = .loading
    }
    func selectProvince(province: String) {
        self.province = province
        contentState = .city
    }
    func backProvince() {
        self.province = ""
        contentState = .province
    }
    func displayError(text: String) {
        contentState = .error(text: text)
    }
}

// MARK: - Route Protocol

extension MySettingProfileAreaModel: MySettingProfileAreaModelRouterProtocol {
    func routeToLogin() {}
    func closeScreen() {
        routerSubject.close.send()
    }
}

extension MySettingProfileAreaTypes.Model {
    enum ContentState {
        case loading
        case province
        case city
        case error(text: String)
    }
}
