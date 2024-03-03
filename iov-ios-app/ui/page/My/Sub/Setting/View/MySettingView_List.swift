//
//  MySettingView_TopBar.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/3.
//

import SwiftUI

extension MySettingView {
    struct List: View {
        var title: String
        var action: (() -> Void)?
        
        var body: some View {
            Button(action: { action?() }) {
                VStack {
                    HStack {
                        Text(title)
                            .font(.system(size: 18))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 18))
                    }
                    .padding(.top, 25)
                    Divider()
                        .padding(.top, 25)
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    MySettingView.List(title: "标题")
}
