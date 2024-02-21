//
//  CommunityView_Carousel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/20.
//

import SwiftUI

struct CommunityView_Carousel: View {
    let banners: [String] = ["CommunityBanner1", "CommunityBanner2", "CommunityBanner3", "CommunityBanner4"]
    let titles: [String] = ["尽享雪地之美", "露营最佳伴侣", "一张图了解开源汽车", "霸气尽显"]
    
    var body: some View {
        TabView {
            ForEach(Array(banners.enumerated()), id: \.0) { index, banner in
                ZStack {
                    NavigationLink(destination: CommunitySubjectView()) {
                        Image(banners[index])
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                    }
                    HStack {
                        Text(titles[index])
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                    }
                    .padding(.top, 270)
                    .padding(.leading, 30)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle()) // 设置滚动样式
        .frame(maxWidth: .infinity)
        .frame(height: 400) // 设置轮播图高度
    }
}

struct CommunityView_Carousel_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView_Carousel()
    }
}
