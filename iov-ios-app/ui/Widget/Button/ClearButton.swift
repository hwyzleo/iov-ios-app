//
//  ClearButton.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/12/14.
//

import SwiftUI

struct ClearButton: ViewModifier {
    @Binding var text: String

    public func body(content: Content) -> some View
    {
        ZStack(alignment: .trailing)
        {
            content

            if !text.isEmpty
            {
                Button(action:
                {
                    self.text = ""
                })
                {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
        }
    }
}
