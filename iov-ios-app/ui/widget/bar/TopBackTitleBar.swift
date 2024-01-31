//
//  TopTitleBar.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/13.
//

import Foundation
import SwiftUI

/// 顶部带返回的标题Bar
struct TopBackTitleBar: View {
    @Environment(\.dismiss) private var dismiss
    var title: String = ""
    var action: (() -> Void)?
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    action?() ?? dismiss()
                }) {
                    Image("back")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .leading)
                        .padding(.leading, 20)
                }
                .buttonStyle(.plain)
                Spacer()
            }
            HStack {
                HStack {
                    Text(title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .bold()
                }
            }
        }
    }
}

#if DEBUG
// MARK: - Previews
struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBackTitleBar(title: "标题")
    }
}
#endif
