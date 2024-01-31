//
//  File.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import Foundation
import SwiftUI

struct BottomLineModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(.gray),
                alignment: .bottom
            )
    }
}
