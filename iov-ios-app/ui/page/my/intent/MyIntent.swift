//
//  MyIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class MyIntent {
    
    // MARK: Model
    
    private weak var model: MyModelActionProtocol?
    private weak var modelRouter: MyModelRouterProtocol?
    
    init(model: MyModelActionProtocol & MyModelRouterProtocol) {
        self.model = model
        self.modelRouter = model
    }
    
}

extension MyIntent: MyIntentProtocol {
    func viewOnAppear() {
        model?.update()
    }
    func onTapLogin() {
        modelRouter?.routeToLogin()
    }
    func onTapProfile() {
        modelRouter?.routeToProfile()
    }
}
