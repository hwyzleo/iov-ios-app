//
//  CommunityView_Carousel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/20.
//

import SwiftUI

struct CommunityTopicView_Topic: View {
    @State var img = ""
    @State var title = ""
    @State var avatar = ""
    @State var username = ""
    
    var body: some View {
        HStack(alignment: .top) {
            Image(img)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(5)
            Spacer()
                .frame(width: 15)
            VStack(alignment: .leading) {
                Text(title)
                    .bold()
                    .foregroundColor(.black)
                Spacer()
                    .frame(height: 60)
                HStack {
                    if !avatar.isEmpty {
                        AsyncImage(url: URL(string: avatar)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.white
                        }
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .aspectRatio(contentMode: .fit)
                    } else {
                        Image("MyPlaceHolder")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    Text(username)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                }
            }
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .padding(.bottom, 10)
    }
}

struct CommunityTopicView_Topic_Previews: PreviewProvider {
    static var previews: some View {
        CommunityTopicView_Topic(img: "CommunityBanner1", title: "一键舒享的航空座椅", avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663", username: "hwyz_leo")
    }
}
