//
//  ProfileIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

protocol ProfileIntentProtocol {
    func viewOnAppear()
    func enterNickname()
    func modifyNickname(nickname: String)
    func enterGender()
    func modifyGender(gender: String)
}
