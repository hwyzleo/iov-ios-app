//
//  ProfileState.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import Foundation

class ProfileState: MviState {
    var avatar: String = ""
    var nickname: String = ""
    var gender: String = "UNKNOWN"
    var birthday: String = ""
    var isItemView: Bool = false
}
