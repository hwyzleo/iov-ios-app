//
//  CommunityView_Carousel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/20.
//

import SwiftUI

struct CommunityArticleView_Carousel: View {
    let banners: [String] = ["CommunityBanner1", "CommunityBanner2", "CommunityBanner3", "CommunityBanner4"]
    
    var body: some View {
        TabView {
            ForEach(Array(banners.enumerated()), id: \.0) { index, banner in
                ZStack {
                    Image(banners[index])
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(maxWidth: .infinity)
        .frame(height: 400)
    }
}

struct CommunityArticleView_Carousel_Previews: PreviewProvider {
    static var previews: some View {
        CommunityArticleView_Carousel()
    }
}
