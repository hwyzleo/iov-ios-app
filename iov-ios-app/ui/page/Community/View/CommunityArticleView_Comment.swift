//
//  CommunityView_Carousel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/20.
//

import SwiftUI

struct CommunityArticleView_Comment: View {
    var avatar = ""
    var username = ""
    var comment = ""
    var time = ""
    var location = ""
    
    var body: some View {
        HStack(alignment: .top) {
            AvatarImage(avatar: avatar)
            Spacer()
                .frame(width: 20)
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 13)
                HStack {
                    Text(username)
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                Spacer()
                    .frame(height: 20)
                Text(comment)
                Spacer()
                    .frame(height: 10)
                HStack {
                    Text(time)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Text(location)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct CommunityArticleView_Comment_Previews: PreviewProvider {
    static var previews: some View {
        CommunityArticleView_Comment(username: "hwyz_leo", comment: "评论内容", time: "20小时前", location: "重庆")
    }
}
