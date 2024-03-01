//
//  CommunityTopicIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/1.
//

protocol CommunityTopicIntentProtocol : MviIntentProtocol {
    /// 页面出现
    func viewOnAppear(id: String)
    /// 点击内容
    func onTapContent(type: String)
}
