//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct CommunityTopicView: View {
    var body: some View {
        VStack {
            ScrollView {
                ZStack(alignment: .top) {
                    Image("CommunityBanner1")
                        .resizable()
                        .frame(height: 400)
                        .scaledToFit()
                    TopBackTitleBar(title: "", color: .white)
                        .padding(.top, 60)
                }
                VStack {
                    HStack {
                        Text("产品解读")
                            .bold()
                        Spacer()
                    }
                    .padding(20)
                    NavigationLink(
                        destination: {}
                    ) {
                        CommunityTopicView_Topic(img: "CommunityBanner1", title: "智能穿越助你探索山晒", avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663", username: "hwyz_leo")
                    }
                    NavigationLink(
                        destination: {}
                    ) {
                        CommunityTopicView_Topic(img: "CommunityBanner2", title: "户外露营生活新选择", avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663", username: "hwyz_leo")
                    }
                    NavigationLink(
                        destination: {}
                    ) {
                        CommunityTopicView_Topic(img: "CommunityBanner3", title: "一键舒享的航空座椅", avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663", username: "hwyz_leo")
                    }
                }
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

struct CommunityTopicView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityTopicView()
    }
}
