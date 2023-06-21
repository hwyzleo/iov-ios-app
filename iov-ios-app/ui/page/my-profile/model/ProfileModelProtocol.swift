//
//  ProfileModelProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

// MARK: - View State

protocol ProfileModelStateProtocol {
    var contentState: ProfileTypes.Model.ContentState { get }
    var loadingText: String { get }
    var avatar: String { get }
    var nickname: String { get }
    var gender: String { get }
}

// MARK: - Intent Action

protocol ProfileModelActionProtocol: AnyObject {
    func displayLoading()
    func update(account: AccountInfo)
    func enterNickname()
    func updateNickname(nickname: String)
    func enterGender()
    func updateGender(gender: String)
    func displayError(text: String)
}
