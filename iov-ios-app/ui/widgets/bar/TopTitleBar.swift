//
//  TopTitleBar.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/13.
//

import Foundation
import SwiftUI

struct TopTitleBarView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.backward")
                        .padding()
                }
            
                Spacer()
            }
        }
    }
}

#if DEBUG
// MARK: - Previews
struct TopTitleBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopTitleBarView()
    }
}
#endif
