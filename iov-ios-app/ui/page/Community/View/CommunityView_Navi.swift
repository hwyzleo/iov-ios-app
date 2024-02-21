//
//  CommunityView_Carousel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/20.
//

import SwiftUI

struct CommunityView_Navi: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("进一步了解")
                    .bold()
                Spacer()
            }
            HStack {
                NavigationLink(
                    destination: CommunityTopicView()
                        .navigationBarBackButtonHidden()
                ) {
                    ZStack {
                        Image("CommunityBanner1")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(5)
                        Text("产品解读")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .padding(.top, 60)
                    }
                }
                Spacer()
                NavigationLink(
                    destination: CommunityTopicView()
                    .navigationBarBackButtonHidden()
                ) {
                    ZStack {
                        Image("CommunityBanner2")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(5)
                        Text("购车指南")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .padding(.top, 60)
                    }
                }
                Spacer()
                NavigationLink(
                    destination: CommunityTopicView()
                    .navigationBarBackButtonHidden()
                ) {
                    ZStack {
                        Image("CommunityBanner3")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(5)
                        Text("预约试驾")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .padding(.top, 60)
                    }
                }
            }
        }
        .padding(20)
    }
}

struct CommunityView_Navi_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView_Navi()
    }
}
