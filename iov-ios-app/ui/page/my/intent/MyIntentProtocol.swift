//
//  MyIntentProtocol.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

protocol MyIntentProtocol : MviIntentProtocol {
    /// 点击设置
    func onTapSetting()
    /// 点击用户资料
    func onTapProfile()
    /// 点击我的作品
    func onTapMyArticle()
    /// 点击我的积分
    func onTapMyPoints()
    /// 点击我的权益
    func onTapMyRights()
    /// 点击我的订单
    func onTapMyOrder()
    /// 点击邀请好友
    func onTapMyInvite()
    /// 点击试驾报告
    func onTapTestDriveReport()
    /// 点击充电桩
    func onTapChargingPile()
}
