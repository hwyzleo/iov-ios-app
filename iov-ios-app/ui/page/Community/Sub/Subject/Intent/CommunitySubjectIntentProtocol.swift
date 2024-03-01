//
//  CommunitySubjectIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/1.
//

protocol CommunitySubjectIntentProtocol : MviIntentProtocol {
    /// 页面出现
    func viewOnAppear(id: String)
    /// 点击具体内容
    func onTapContent(type: String)
}
