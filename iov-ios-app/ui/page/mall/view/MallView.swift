//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct MallView: View {
    
    @StateObject var container: MviContainer<MallIntentProtocol, MallModelStateProtocol>
    private var intent: MallIntentProtocol { container.intent }
    private var state: MallModelStateProtocol { container.model }
    @EnvironmentObject var appGlobalState: AppGlobalState
    
    var body: some View {
        VStack {
            ScrollView {
                BannerView()
                VStack {
                    HStack {
                        Text("品质配件")
                        Spacer()
                    }
                    HStack {
                        Button(action: {
                            intent.onTapProduct(id: "aaa")
                        }) {
                            VStack(alignment: .leading) {
                                Image("MallBanner1")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                                    .padding(.bottom, 1)
                                Text("车载无人机")
                                    .font(.system(size: 14))
                                    .padding(.bottom, 1)
                                Text("¥ 1,000")
                                    .font(.system(size: 12))
                            }
                        }
                        .buttonStyle(.plain)
                        Button(action: {
                            intent.onTapProduct(id: "bbb")
                        }) {
                            VStack(alignment: .leading) {
                                Image("MallBanner2")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                                    .padding(.bottom, 1)
                                Text("露营帐篷")
                                    .font(.system(size: 14))
                                    .padding(.bottom, 1)
                                Text("¥ 0.02")
                                    .font(.system(size: 12))
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    HStack {
                        Button(action: {
                            intent.onTapProduct(id: "ccc")
                        }) {
                            VStack(alignment: .leading) {
                                Image("MallBanner3")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                                    .padding(.bottom, 1)
                                Text("车辆模型")
                                    .font(.system(size: 14))
                                    .padding(.bottom, 1)
                                Text("¥ 700")
                                    .font(.system(size: 12))
                            }
                        }
                        .buttonStyle(.plain)
                        Button(action: {
                            intent.onTapProduct(id: "ddd")
                        }) {
                            VStack(alignment: .leading) {
                                Image("MallBanner2")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                                    .padding(.bottom, 1)
                                Text("露营帐篷")
                                    .font(.system(size: 14))
                                    .padding(.bottom, 1)
                                Text("¥ 0.02")
                                    .font(.system(size: 12))
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(20)
            }
            .ignoresSafeArea()
        }
        .onAppear {
            intent.viewOnAppear()
            appGlobalState.currentView = "Mall"
        }
        .modifier(MallRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

extension MallView {
    
    struct BannerView: View {
        let banners: [String] = ["MallBanner1", "MallBanner2", "MallBanner3"]
        let titles: [String] = ["车载无人机", "露营帐篷", "车辆模型"]

        var body: some View {
            TabView {
                ForEach(Array(banners.enumerated()), id: \.0) { index, banner in
                    ZStack {
                        Image(banners[index])
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                        HStack {
                            Text(titles[index])
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.top, 180)
                        .padding(.leading, 20)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle()) // 设置滚动样式
            .frame(maxWidth: .infinity)
            .frame(height: 300) // 设置轮播图高度
            
            
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

struct MallView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        MallView(container: MallView.buildContainer())
            .environmentObject(appGlobalState)
    }
}
