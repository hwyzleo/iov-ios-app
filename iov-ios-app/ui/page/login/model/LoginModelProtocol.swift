//
//  LoginModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol LoginModelStateProtocol {
    var contentState: LoginTypes.Model.ContentState { get }
    var mobile: String { get }
    var countryRegionCode: String { get }
    var routerSubject: LoginRouter.Subjects { get }
}

// MARK: - Intent Action

protocol LoginModelActionProtocol: AnyObject {
    func displayLoading()
    func routeInputVerify(countryRegionCode: String, mobile: String)
    func loginSuccess()
    func displayError(text: String)
}
