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
            intent.viewOnAppear()
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
        
        var body: some View {
            VStack {
                ScrollView {
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
                            CommunityView.Topic(contentBlock: contentBlock)
                            Divider()
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                                .padding(.bottom, 20)
                        case "article":
                            CommunityView.Article(baseContent: contentBlock.data[0])
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
