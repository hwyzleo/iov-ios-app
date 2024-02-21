//
//  CommunityView_Carousel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/20.
//

import SwiftUI

struct CommunityView_Topic: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("北境之旅，开源出发")
                    .font(.system(size: 18))
                    .bold()
                Spacer()
                NavigationLink(
                    destination: CommunityTopicView()
                    .navigationBarBackButtonHidden()
                ) {
                    Text("查看更多")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            HStack {
                NavigationLink(
                    destination: CommunityArticleView()
                    .navigationBarBackButtonHidden()
                ) {
                    VStack(alignment: .leading) {
                        Image("CommunityBanner1")
                            .resizable()
                            .scaledToFit()
                        Text("首批车主用车心声")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }
                }
                NavigationLink(
                    destination: CommunityArticleView()
                    .navigationBarBackButtonHidden()
                ) {
                    VStack(alignment: .leading) {
                        Image("CommunityBanner2")
                            .resizable()
                            .scaledToFit()
                        Text("沉浸式露营")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }
                }
            }
            HStack {
                NavigationLink(
                    destination: CommunityArticleView()
                    .navigationBarBackButtonHidden()
                ) {
                    VStack(alignment: .leading) {
                        Image("CommunityBanner3")
                            .resizable()
                            .scaledToFit()
                        Text("内饰揭秘")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }
                }
                NavigationLink(
                    destination: CommunityArticleView()
                    .navigationBarBackButtonHidden()
                ) {
                    VStack(alignment: .leading) {
                        Image("CommunityBanner4")
                            .resizable()
                            .scaledToFit()
                        Text("城市穿越")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .padding(20)
    }
}

struct CommunityView_Topic_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView_Topic()
    }
}
