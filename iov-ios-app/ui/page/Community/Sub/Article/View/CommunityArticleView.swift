//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct CommunityArticleView: View {
    @StateObject var container: MviContainer<CommunityArticleIntentProtocol, CommunityArticleModelStateProtocol>
    private var intent: CommunityArticleIntentProtocol { container.intent }
    private var state: CommunityArticleModelStateProtocol { container.model }
    @EnvironmentObject var appGlobalState: AppGlobalState
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
            case .content:
                Content(article: state.article)
            case let .error(text):
                ErrorTip(text: text)
            }
        }
        .onAppear {
            if appGlobalState.parameters.keys.contains("id") {
                intent.viewOnAppear(id: appGlobalState.parameters["id"] as! String)
            }
            appGlobalState.currentView = "CommunityArticle"
        }
        .modifier(CommunityArticleRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

extension CommunityArticleView {
    struct Content: View {
        var article: Article
        @State var comment: String = ""
        
        var body: some View {
            VStack {
                ScrollView {
                    ZStack(alignment: .top) {
                        CommunityArticleView.Carousel(images: article.images)
                        TopBackTitleBar(color: .white)
                            .padding(.top, 60)
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            AvatarImage(avatar: article.avatar ?? "")
                            Spacer()
                                .frame(width: 10)
                            VStack(alignment: .leading) {
                                Text(article.username)
                                Spacer()
                                    .frame(height: 10)
                                HStack {
                                    Text(tsDisplay(ts: article.ts))
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                    Text("\(article.views)次浏览")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                    Text(article.location ?? "")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                }
                            }
                            Spacer()
                        }
                        Spacer()
                            .frame(height: 20)
                        HStack {
                            Text(article.title)
                                .font(.system(size: 18))
                                .bold()
                        }
                        HStack {
                            ForEach(Array(article.tags.enumerated()), id: \.0) { index, tag in
                                Text("# \(tag)")
                                    .font(.system(size: 12))
                            }
                        }
                        .padding(5)
                        .background(Color(hex: 0xf2f2f2))
                        .cornerRadius(10)
                        Text(article.content)
                        Spacer()
                            .frame(height: 50)
                        Text("评论")
                            .bold()
                        Spacer()
                            .frame(height: 20)
                        CommunityArticleView_Comment(comments: article.comments)
                    }
                    .padding(20)
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea()
                HStack {
                    TextField("说点什么吧", text: $comment)
                    VStack {
                        Image(systemName: "bubble")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        Text("0")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                    }
                    Spacer()
                        .frame(width: 40)
                    VStack {
                        Image(systemName: "hand.thumbsup")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        Text("0")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                    }
                    Spacer()
                        .frame(width: 40)
                    VStack {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        Text("0")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 10)
            }
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
    static var article: Article = Article.init(
        id: "1",
        title: "测试标题",
        content: "测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容",
        images: [
            "https://pic.imgdb.cn/item/65df360f9f345e8d03ae3131.png",
            "https://pic.imgdb.cn/item/65e0201e9f345e8d03620461.png",
            "https://pic.imgdb.cn/item/65df4e159f345e8d0301a944.png",
            "https://pic.imgdb.cn/item/65df55069f345e8d0318a51c.png"
        ],
        ts: 1709253469377,
        username: "测试用户名",
        avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663",
        views: 22,
        location: "重庆",
        tags: ["测试标签"],
        comments: [
            ArticleComment.init(id: "1", parentId: "1", comment: "测试评论1", ts: 1709261044490, username: "测试用户1", location: "江苏省"),
            ArticleComment.init(id: "3", parentId: "1", comment: "测试评论3", ts: 1709261044490, username: "测试用户3", location: "上海市"),
            ArticleComment.init(id: "2", parentId: "2", comment: "测试评论2", ts: 1709261044490, username: "测试用户2", location: "山东省")
        ]
    )
    
    static var previews: some View {
        CommunityArticleView.Content(article: article)
    }
}
