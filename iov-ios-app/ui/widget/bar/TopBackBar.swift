//
//  TopTitleBar.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/13.
//

import Foundation
import SwiftUI

struct TopBackBar: View {
    @Environment(\.dismiss) private var dismiss
    var action: (() -> Void)?
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    action?() ?? dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .padding()
                }
            
                Spacer()
            }
        }
    }
}

#if DEBUG
// MARK: - Previews
struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBackBar()
    }
}
#endif
