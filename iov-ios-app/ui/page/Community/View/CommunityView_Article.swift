//
//  CommunityView_Carousel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/20.
//

import SwiftUI
import Kingfisher

extension CommunityView {
    
    struct Article: View {
        var baseContent: BaseContent = BaseContent.init(id: "1", type: "article", title: "开源汽车——旅途的最佳伴侣!", intro: "趁春节假期，一家四口回了趟四川老家，途径乐山、石棉、泸定、康定、宜宾等地，总……", images: ["https://pic.imgdb.cn/item/65df360f9f345e8d03ae3131.png","https://pic.imgdb.cn/item/65df360f9f345e8d03ae3131.png","https://pic.imgdb.cn/item/65df360f9f345e8d03ae3131.png","https://pic.imgdb.cn/item/65df360f9f345e8d03ae3131.png"], ts: 1709124212841, username: "hwyz_leo", avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663")
        
        var body: some View {
            VStack(alignment: .leading) {
                VStack {
                    HStack(alignment: .top) {
                        AvatarImage(avatar: baseContent.avatar ?? "", width: 50)
                        VStack(alignment: .leading) {
                            Text(baseContent.username ?? "")
                            Spacer()
                                .frame(height: 5)
                            Text("18小时前")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    NavigationLink(
                        destination: {}
                    ) {
                        VStack(alignment: .leading) {
                            Text(baseContent.title)
                                .bold()
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                            Spacer()
                                .frame(height: 10)
                            Text(baseContent.intro ?? "")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .lineSpacing(5)
                        }
                    }
                    Spacer()
                        .frame(height: 10)
                    HStack {
                        VStack {
                            Text("# 发现家乡的美")
                                .font(.system(size: 12))
                        }
                        .padding(5)
                        .background(Color(hex: 0xf2f2f2))
                        .cornerRadius(10)
                        Spacer()
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                Spacer()
                    .frame(height: 10)
                if baseContent.images.count > 0 {
                    HStack {
                        Spacer()
                        KFImage(URL(string: baseContent.images[0])!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 175, height: 175)
                            .clipped()
                        Spacer()
                        if baseContent.images.count > 1 {
                            KFImage(URL(string: baseContent.images[1])!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 175, height: 175)
                                .clipped()
                            Spacer()
                        }
                    }
                    if baseContent.images.count > 2 {
                        HStack {
                            Spacer()
                            KFImage(URL(string: baseContent.images[2])!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 175, height: 175)
                                .clipped()
                            Spacer()
                            if baseContent.images.count > 3 {
                                KFImage(URL(string: baseContent.images[3])!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 175, height: 175)
                                    .clipped()
                                Spacer()
                            }
                        }
                    }
                    Spacer()
                        .frame(height: 10)
                }
                HStack {
                    NavigationLink(
                        destination: {}
                    ) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.gray)
                        Text("银座购物广场店")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    NavigationLink(
                        destination: {}
                    ) {
                        Image(systemName: "bubble")
                            .foregroundColor(.black)
                        Text("4")
                            .foregroundColor(.black)
                    }
                    Spacer()
                        .frame(width: 20)
                    Image(systemName: "hand.thumbsup")
                    Text("12")
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom, 20)
            }
        }
    }
}


struct CommunityView_Article_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView.Article()
    }
}
