//
//  ArrowRightListItem.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/17.
//

import Foundation
import SwiftUI

struct ArrowRightListItemView: View {
    
    var title: String
    var iconName: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .padding(.leading, 30)
            Text(title)
                .padding(.leading, 10)
            Spacer()
            Image(systemName: "chevron.right")
                .padding(.trailing, 30)
        }.padding(.bottom, 20)
    }
}
