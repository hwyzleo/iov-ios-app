//
//  MyView_TopBar.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/2.
//

import SwiftUI

extension MyView {
    struct TopBar: View {
        var tapSettingAction: (() -> Void)?
        
        var body: some View {
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image("message")
                    }
                    .buttonStyle(.plain)
                    Spacer()
                        .frame(width: 20)
                    Button(action: {
                        tapSettingAction?()
                    }) {
                        Image("setting")
                    }
                    .buttonStyle(.plain)
                }
                .padding(.trailing, 20)
            }
        }
    }
}

#Preview {
    MyView.TopBar()
}
