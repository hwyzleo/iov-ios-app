//
//  TextItem.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import SwiftUI
import Kingfisher

struct AvatarImage: View {
    var avatar: String?
    var width: CGFloat = 50.0

    var body: some View {
        if let unwrappedAvatar = avatar, !unwrappedAvatar.isEmpty {
            KFImage(URL(string: unwrappedAvatar)!)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .aspectRatio(contentMode: .fit)
        } else {
            Image("MyPlaceHolder")
                .resizable()
                .frame(width: width, height: width)
        }
    }
}

struct AvatarImage_Previews: PreviewProvider {
    static var previews: some View {
        AvatarImage()
    }
}
