//
//  ContentList.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import SwiftUI

struct ContentList: View {
    var title: String = "标题"
    var content: String = "内容"
    var action: (() -> Void)?
    var body: some View {
        Button(action: {
            self.action?()
        }) {
            HStack {
                HStack {
                    Text(title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                    Spacer()
                    Text(content)
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.right")
                        .padding(.trailing, 10)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 20)
                .modifier(BottomLineModifier())
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

struct ContentList_Previews: PreviewProvider {
    static var previews: some View {
        ContentList(){ }
    }
}
