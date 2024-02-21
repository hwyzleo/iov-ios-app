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
        VStack {
            ScrollView {
                CommunityView_Carousel()
                CommunityView_Navi()
                CommunityView_Article()
                CommunityView_Topic()
                Spacer()
                    .frame(height: 100)
            }
            .scrollIndicators(.hidden)
            .ignoresSafeArea()
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

struct CommunityView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        CommunityView(container: CommunityView.buildContainer())
            .environmentObject(appGlobalState)
    }
}
