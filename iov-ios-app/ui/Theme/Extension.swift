//
//  ColorExtension.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/12/14.
//

import SwiftUI

/// 支持侧滑返回
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
