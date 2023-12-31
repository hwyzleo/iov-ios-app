//
//  MyModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol MyModelStateProtocol {
    var contentState: MyTypes.Model.ContentState { get }
    var routerSubject: MyRouter.Subjects { get }
}

// MARK: - Intent Action

protocol MyModelActionProtocol: AnyObject {
    func update()
}

// MARK: - Route

protocol MyModelRouterProtocol: AnyObject {
    func routeToLogin()
    func routeToProfile()
}
