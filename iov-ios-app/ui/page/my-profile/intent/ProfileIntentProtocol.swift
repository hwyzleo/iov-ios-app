//
//  ProfileIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

protocol ProfileIntentProtocol {
    func viewOnAppear()
    func onTapBackProfile()
    func onTapNickname(nickname: String)
    func onTapNicknameSaveButton(nickname: String)
    func onTapGender(gender: String)
    func modifyGender(gender: String)
}
