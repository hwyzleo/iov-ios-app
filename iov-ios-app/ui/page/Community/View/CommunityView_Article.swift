//
//  CommunityView_Carousel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/20.
//

import SwiftUI

struct CommunityView_Article: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image("MyPlaceHolder")
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text("hwyz_leo")
                    Spacer()
                        .frame(height: 5)
                    Text("18小时前")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            NavigationLink(
                destination: CommunityArticleView()
                .navigationBarBackButtonHidden()
            ) {
                VStack(alignment: .leading) {
                    Text("开源汽车——旅途的最佳伴侣!")
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Spacer()
                        .frame(height: 10)
                    Text("趁春节假期，一家四口回了趟四川老家，途径乐山、石棉、泸定、康定、宜宾等地，总……")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .lineSpacing(5)
                }
            }
            Spacer()
                .frame(height: 10)
            HStack {
                Text("# 发现家乡的美")
                    .font(.system(size: 12))
            }
            .padding(5)
            .background(Color(hex: 0xf2f2f2))
            .cornerRadius(10)
            Spacer()
                .frame(height: 10)
            HStack {
                Image("CommunityBanner1")
                    .resizable()
                    .scaledToFit()
                Image("CommunityBanner2")
                    .resizable()
                    .scaledToFit()
            }
            HStack {
                Image("CommunityBanner3")
                    .resizable()
                    .scaledToFit()
                Image("CommunityBanner4")
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
                .frame(height: 10)
            HStack {
                NavigationLink(
                    destination: CommunityArticleView()
                    .navigationBarBackButtonHidden()
                ) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.gray)
                    Text("银座购物广场店")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                NavigationLink(
                    destination: CommunityArticleView()
                    .navigationBarBackButtonHidden()
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
        }
        .padding(20)
    }
}

struct CommunityView_Article_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView_Article()
    }
}
