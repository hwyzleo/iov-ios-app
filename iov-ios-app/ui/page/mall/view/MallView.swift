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
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
            case .content:
                RefreshContent(intent: intent, state: state)
            case let .error(text):
                ErrorTip(text: text)
            }
        }
        .onAppear {
            if state.recommendedProducts.count == 0 {
                intent.viewOnAppear()
            }
        }
        .modifier(MallRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

extension MallView {
    struct RefreshContent: View {
        var intent: MallIntentProtocol
        var state: MallModelStateProtocol
        @State var isRefresh = false
        
        var body: some View {
            VStack {
                RefreshScrollView(offDown: 100.0, listH: ScreenH - kNavHeight - kBottomSafeHeight, refreshing: $isRefresh) {
                    // 下拉刷新触发
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                        // 刷新完成，关闭刷新
                        intent.viewOnAppear()
                        isRefresh = false
                    })
                } content: {
                    Content(intent: intent, recommendedProducts: state.recommendedProducts, categories: state.categories)
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea()
            }
        }
    }
    
    struct Content: View {
        var intent: MallIntentProtocol
        var recommendedProducts: [Product]
        var categories: [String:[Product]]
        @EnvironmentObject var appGlobalState: AppGlobalState
        
        var body: some View {
            VStack {
                MallView.Carousel(products: recommendedProducts)
                ForEach(categories.sorted(by: {$0.key < $1.key}), id: \.key) { title, products in
                    MallView.Category(title: title, products: products)
                }
            }
        }
    }
}

struct MallView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var recommendedProducts: [Product] = [
        Product.init(id: "1", name: "车载无人机", recommendedCover: "https://pic.imgdb.cn/item/65e9b3879f345e8d036bff96.png"),
        Product.init(id: "2", name: "露营帐篷", recommendedCover: "https://pic.imgdb.cn/item/65e9b3939f345e8d036c2633.png"),
        Product.init(id: "3", name: "车辆模型", recommendedCover: "https://pic.imgdb.cn/item/65e9b39f9f345e8d036c4a0a.png")
    ]
    static var categories: [String:[Product]] = [
        "品质配件": [
            Product.init(id: "1", name: "车载无人机", cover: "https://pic.imgdb.cn/item/65e9b3879f345e8d036bff96.png", price: "1000"),
            Product.init(id: "2", name: "露营帐篷", cover: "https://pic.imgdb.cn/item/65e9b3939f345e8d036c2633.png", price: "500"),
            Product.init(id: "3", name: "车辆模型", cover: "https://pic.imgdb.cn/item/65e9b39f9f345e8d036c4a0a.png", price: "800"),
            Product.init(id: "4", name: "露营帐篷", cover: "https://pic.imgdb.cn/item/65e9b3939f345e8d036c2633.png", price: "550")
        ]
    ]
    static var previews: some View {
        let container = MallView.buildContainer()
        ScrollView {
            MallView.Content(intent: container.intent, recommendedProducts: recommendedProducts, categories: categories)
                .environmentObject(appGlobalState)
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
    }
}
