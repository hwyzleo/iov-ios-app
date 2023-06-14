//
//  AppGlobalState.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import Foundation

class AppGlobalState: ObservableObject {
    @Published var isLogin: Bool = false
    @Published var isLoginViewActive: Bool = false
    @Published var selectedTab: Int = 0
}
