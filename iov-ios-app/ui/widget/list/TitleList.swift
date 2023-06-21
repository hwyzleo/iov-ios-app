//
//  ArrowRightListItem.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/17.
//

import Foundation
import SwiftUI

struct TitleList: View {
    var title: String = "标题"
    var iconName: String = "square.fill"
    var action: (() -> Void)?
    var body: some View {
        Button(action: {
            self.action?()
        }) {
            HStack {
                Image(systemName: iconName)
                    .padding(.leading, 30)
                Text(title)
                    .padding(.leading, 10)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(.trailing, 30)
            }.padding(.bottom, 20)
        }.foregroundColor(.black)
    }
}

struct TitleList_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        TitleList()
    }
}
