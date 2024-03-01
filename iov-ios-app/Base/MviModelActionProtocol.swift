//
//  MviAction.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

protocol MviModelActionProtocol: AnyObject {
    /// 显示加载中
    func displayLoading()
    /// 显示错误
    func displayError(text: String)
}
