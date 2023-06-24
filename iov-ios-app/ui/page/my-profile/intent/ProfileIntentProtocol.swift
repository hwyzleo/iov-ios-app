//
//  ProfileIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

protocol ProfileIntentProtocol {
    func viewOnAppear()
    func onSelectAvatar(image: UIImage)
    func onTapBackProfile()
    func onTapNickname()
    func onTapNicknameSaveButton(nickname: String)
    func onTapGender()
    func modifyGender(gender: String)
}
