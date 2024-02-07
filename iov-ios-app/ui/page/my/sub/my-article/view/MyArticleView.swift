//
//  MySettingView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

struct MyArticleView: View {
    
    @StateObject var container: MviContainer<MyArticleIntentProtocol, MyArticleModelStateProtocol>
    private var intent: MyArticleIntentProtocol { container.intent }
    private var state: MyArticleModelStateProtocol { container.model }
    @EnvironmentObject var appGlobalState: AppGlobalState
    
    var body: some View {
        VStack {
            TopBackTitleBar(title: "我的作品")
            VStack {
                Spacer()
                    .frame(height: 300)
                Text("您还没有发布过作品")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                    .padding(10)
                Button("马上发布") {
                    self.intent.onTapLogin()
                }
                .font(.system(size: 15))
                .padding(10)
                .frame(width: 120)
                .foregroundColor(Color.black)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .scaleEffect(1)
            }
            Spacer()
        }
        .onAppear {
            appGlobalState.currentView = "MyArticle"
        }
    }
    
}

struct MyArticleView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        MyArticleView(container: MyArticleView.buildContainer())
            .environmentObject(appGlobalState)
    }
}
