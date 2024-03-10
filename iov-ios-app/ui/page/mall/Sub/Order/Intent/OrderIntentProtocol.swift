//
//  OrderIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

protocol OrderIntentProtocol : MviIntentProtocol {
    /// 页面出现
    func viewOnAppear(id: String, buyCount: Int)
    /// 点击收货地址
    func onTapAddress()
}
