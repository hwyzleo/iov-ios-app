//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct ProductView: View {
    
    @StateObject var container: MviContainer<ProductIntentProtocol, ProductModelStateProtocol>
    private var intent: ProductIntentProtocol { container.intent }
    private var state: ProductModelStateProtocol { container.model }
    @EnvironmentObject var appGlobalState: AppGlobalState
    @Environment(\.dismiss) private var dismiss
    @State private var showStack = false
    @State private var showBuyConfirm = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                ScrollView {
                    ZStack(alignment: .top) {
                        PhotoView()
                        TopBackTitleBar(title: "")
                            .foregroundColor(.white)
                            .padding(.top, 55)
                        GeometryReader { geometry in
                            Color.clear
                                .onChange(of: geometry.frame(in: .global).minY) { value in
                                    showStack = value < 0
                                }
                        }
                        .frame(height: 0)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("车载无人机")
                                Spacer()
                            }
                            .padding(.bottom, 5)
                            HStack {
                                Text("¥ 1,000")
                                    .font(.system(size: 14))
                                    .bold()
                                    .padding(.trailing, 10)
                                Image("diamond")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                Text("100,000")
                                    .font(.system(size: 14))
                                    .bold()
                                Spacer()
                            }
                            .padding(.bottom, 20)
                            .modifier(BottomLineModifier())
                            HStack {
                                Text("规格")
                                    .font(.system(size: 14))
                                Spacer()
                                Text("x1")
                                    .font(.system(size: 14))
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding(.top, 20)
                            .padding(.bottom, 26)
                            .modifier(BottomLineModifier())
                            VStack {
                                Text("产品详情")
                                Image("MallBanner1")
                                    .resizable()
                                    .scaledToFill()
                                Image("MallBanner2")
                                    .resizable()
                                    .scaledToFill()
                                Image("MallBanner3")
                                    .resizable()
                                    .scaledToFill()
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 20)
                            .modifier(BottomLineModifier())
                            HStack {
                                Text("服务说明")
                                    .font(.system(size: 14))
                                Spacer()
                                Text("查看更多")
                                    .font(.system(size: 14))
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding(.top, 20)
                            .padding(.bottom, 26)
                            .modifier(BottomLineModifier())
                        }
                        .padding(20)
                        .padding(.top, 300)
                    }
                    
                }
                .ignoresSafeArea()
                HStack {
                    Image(systemName: "ellipsis.message")
                    Spacer()
                    Button(action: {
                        showBuyConfirm = true
                    }) {
                        Text("立即购买")
                            .font(.system(size: 12))
                    }
                    .padding(8)
                    .frame(width: 150)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(22.5)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 5)
            }
            .sheet(isPresented: $showBuyConfirm) {
                TopCloseTitleBar(title: "") {
                    showBuyConfirm = false
                }
                .padding(.trailing, 20)
                .padding(.top, 20)
                BuyConfirm(state: state, intent: intent)
                    .presentationDetents([.height(500)])
            }
            if showStack {
                ZStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image("back")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .leading)
                                .padding(.leading, 20)
                        }
                        .buttonStyle(.plain)
                        Spacer()
                    }
                    .frame(height: 40)
                    HStack {
                        HStack {
                            Text("")
                                .frame(maxWidth: .infinity, alignment: .center)
                                .bold()
                        }
                    }
                    .frame(height: 40)
                }
                .background(Color.white)
            }
        }
        .onAppear {
            intent.viewOnAppear()
            appGlobalState.currentView = "Product"
        }
        .modifier(ProductRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

extension ProductView {
    
    private struct PhotoView: View {
        let banners: [String] = ["MallBanner1", "MallBanner2", "MallBanner3"]

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

struct ProductView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        ProductView(container: ProductView.buildContainer())
            .environmentObject(appGlobalState)
    }
}
