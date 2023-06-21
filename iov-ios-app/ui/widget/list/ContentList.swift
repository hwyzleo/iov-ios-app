//
//  ContentList.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import SwiftUI

struct ContentList<Destination>: View where Destination: View {
    var title: String = "标题"
    var content: String = "内容"
    var destination: (() -> Destination)?
    @State var isActive: Bool = true
    var body: some View {
        NavigationLink(destination: destination?()) {
            HStack {
                HStack {
                    Text(title)
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
        }
    }
}

struct ContentList_Previews: PreviewProvider {
    static var previews: some View {
        ContentList(){ EmptyView() }
    }
}
