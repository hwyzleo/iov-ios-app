//
//  MyIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

protocol MyIntentProtocol : MviIntentProtocol {
    
    /// 点击用户资料
    func onTapProfile()
    /// 点击退出
    func onTapLogout()
    
}
