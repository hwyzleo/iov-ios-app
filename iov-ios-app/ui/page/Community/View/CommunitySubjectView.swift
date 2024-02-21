//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct CommunitySubjectView: View {
    
    var body: some View {
        VStack {
            ScrollView {
                ZStack(alignment: .top) {
                    Image("CommunityBanner1")
                        .resizable()
                        .frame(height: 300)
                        .scaledToFit()
                    TopBackTitleBar(title: "话题", color: .white)
                        .padding(.top, 60)
                    VStack {
                        VStack {
                            Spacer()
                                .frame(height: 10)
                            HStack {
                                Text("# 燃行冬日，现在出发")
                                    .font(.system(size: 20))
                                    .bold()
                                Spacer()
                            }
                            .padding(10)
                            Spacer()
                                .frame(height: 10)
                            Text("本期话题#燃行冬日，一起出发，晒出冬日氛围感照片，分享出游拍下的冬日美景……")
                                .padding(10)
                            Spacer()
                                .frame(height: 10)
                            HStack {
                                ZStack(alignment: .leading) {
                                    AvatarImage(avatar: "https://img1.doubanio.com/icon/ul173067863-19.jpg", width: 25)
                                        .padding(0)
                                    AvatarImage(avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663", width: 25)
                                        .padding(0)
                                        .padding(.leading, 12)
                                    AvatarImage(avatar: "https://img2.doubanio.com/icon/ul151927045-1.jpg", width: 25)
                                        .padding(0)
                                        .padding(.leading, 24)
                                }
                                Text("56人参与 | 83条内容")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .padding(10)
                            HStack {
                                Text("剩余")
                                Text("08天07时09分28秒")
                                Spacer()
                                Text("查看奖品>")
                            }
                            .padding(10)
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: 0x5c2123))
                            .background(Color(hex: 0xf2eceb))
                        }
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(5)
                        .shadow(color: Color.gray, radius: 0.5, x: 0, y: 0)
                    }
                    .padding(20)
                    .padding(.top, 200)
                }
                LabelTabView(tabs: ["默认", "最新"], views: [AnyView(CommunitySubjectView_Articles()), AnyView(CommunitySubjectView_Articles())])
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
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

struct CommunitySubjectView_Previews: PreviewProvider {
    static var previews: some View {
        CommunitySubjectView()
    }
}
