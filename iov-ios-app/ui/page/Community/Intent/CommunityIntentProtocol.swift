//
//  CommunityIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

protocol CommunityIntentProtocol : MviIntentProtocol {
    /// 点击具体内容
    func onTapContent(type: String)
}
