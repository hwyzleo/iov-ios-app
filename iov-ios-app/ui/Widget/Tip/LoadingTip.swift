//
//  LoadingTip.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/31.
//

import SwiftUI

struct LoadingTip: View {
    var text: String = "Loading"
    
    var body: some View {
        ZStack {
            Color.white
            Text(text)
        }
    }
}

struct LoadingTip_Previews: PreviewProvider {
    static var previews: some View {
        LoadingTip()
    }
}
