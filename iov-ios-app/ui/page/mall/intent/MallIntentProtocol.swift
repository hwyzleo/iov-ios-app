//
//  MallIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

protocol MallIntentProtocol : MviIntentProtocol {
    /// 点击产品
    func onTapProduct(id: String)
}
