//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct CommunityView: View {
    
    @StateObject var container: MviContainer<CommunityIntentProtocol, CommunityModelStateProtocol>
    private var intent: CommunityIntentProtocol { container.intent }
    private var state: CommunityModelStateProtocol { container.model }
    @EnvironmentObject var appGlobalState: AppGlobalState
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
            case .content:
                Content(intent: intent, state: state)
            case let .error(text):
                ErrorTip(text: text)
            }
        }
        .onAppear {
            if state.contentBlocks.count == 0 {
                intent.viewOnAppear()
            }
            appGlobalState.currentView = "Community"
        }
        .modifier(CommunityRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

extension CommunityView {
    struct Content: View {
        let intent: CommunityIntentProtocol
        let state: CommunityModelStateProtocol
        @EnvironmentObject var appGlobalState: AppGlobalState
        @State var isRefresh = false
        @State var isMore = false
        
        var body: some View {
            VStack {
                RefreshScrollView(offDown: 300.0, listH: ScreenH - kNavHeight - kBottomSafeHeight, refreshing: $isRefresh, isMore: $isMore) {
                    // 下拉刷新触发
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                        // 刷新完成，关闭刷新
                        intent.viewOnAppear()
                        isRefresh = false
                    })
                } moreTrigger: {
                    // 上拉加载更多触发
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                        // 加载完成，关闭加载
                        isMore = false
                    })
                } content: {
                    ForEach(state.contentBlocks, id: \.id) { contentBlock in
                        switch contentBlock.type {
                        case "carousel":
                            CommunityView.Carousel(baseContents: contentBlock.data) { id, type in
                                appGlobalState.parameters["id"] = id
                                intent.onTapContent(type: type)
                            }
                        case "navigation":
                            CommunityView.Navi(title: contentBlock.title, baseContents: contentBlock.data) { id, type in
                                appGlobalState.parameters["id"] = id
                                intent.onTapContent(type: type)
                            }
                            Divider()
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                                .padding(.bottom, 20)
                        case "topic":
                            CommunityView.Topic(contentBlock: contentBlock) { id, type in
                                appGlobalState.parameters["id"] = id
                                intent.onTapContent(type: type)
                            }
                            Divider()
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                                .padding(.bottom, 20)
                        case "article":
                            CommunityView.Article(baseContent: contentBlock.data[0]) { id, type in
                                appGlobalState.parameters["id"] = id
                                intent.onTapContent(type: type)
                            }
                            Divider()
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                                .padding(.bottom, 20)
                        default:
                            EmptyView()
                        }
                    }
                    Spacer()
                        .frame(height: 100)
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea()
            }
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        CommunityView(container: CommunityView.buildContainer())
            .environmentObject(appGlobalState)
    }
}
