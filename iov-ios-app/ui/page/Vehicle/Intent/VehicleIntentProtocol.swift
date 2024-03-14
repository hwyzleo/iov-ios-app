//
//  VehicleIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

protocol VehicleIntentProtocol : MviIntentProtocol {
    /// 点击扫描
    func onTapScan()
    /// 点击上锁
    func onTapLock()
    /// 点击解锁
    func onTapUnlock()
}
