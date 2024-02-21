//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct CommunityArticleView: View {
    
    @State var avatar = "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663"
    
    var body: some View {
        VStack {
            ScrollView {
                ZStack(alignment: .top) {
                    CommunityArticleView_Carousel()
                    TopBackTitleBar(color: .white)
                        .padding(.top, 60)
                }
                VStack(alignment: .leading) {
                    HStack {
                        AvatarImage(avatar: avatar)
                        Spacer()
                            .frame(width: 10)
                        VStack(alignment: .leading) {
                            Text("hwyz_leo")
                            Spacer()
                                .frame(height: 10)
                            HStack {
                                Text("02/19 22:59")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                Text("240次浏览")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                Text("重庆")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        Text("旅途的最佳伴侣！")
                            .font(.system(size: 18))
                            .bold()
                    }
                    HStack {
                        Text("# 发现家乡的美")
                            .font(.system(size: 12))
                    }
                    .padding(5)
                    .background(Color(hex: 0xf2f2f2))
                    .cornerRadius(10)
                    Text("趁春节假期，一家四口回了趟四川老家，途经乐山、石棉、泸定、康定、宜宾等地，总行程1954公里。车的表现让我们非常满意，空间大，装载能力强，底盘扎实稳重，时速跑上120公里一点也不飘，特别是翻越折多山时，很多车都挂了防滑链，而我凭着四条AT胎，稳稳的行驶在冰雪路面，满满的安全感。车子的娱乐功能也值得表扬:看电影，听歌曲，唱卡拉OK，让旅途充满了无穷乐趣;增程式可油可电，毫无里程焦虑，说走就走让我觉得当初的选择是非常正确的!在今后的日子里，我们一起继续向山海出发!")
                    Spacer()
                        .frame(height: 50)
                    Text("评论")
                        .bold()
                    Spacer()
                        .frame(height: 20)
                    CommunityArticleView_Comment(avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663", username: "hwyz_leo", comment: "我自己评论自己", time: "刚刚", location: "上海")
                }
                .padding(20)
            }
            .scrollIndicators(.hidden)
            .ignoresSafeArea()
        }
    }
}

// MARK: - Error View

private struct ErrorContent: View {
    let text: String

    var body: some View {
        ZStack {
            Color.white
            Text(text)
        }
    }
}

struct CommunityArticleView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityArticleView()
    }
}
