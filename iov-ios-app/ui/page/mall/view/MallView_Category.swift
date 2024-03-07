//
//  MallView_Category.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/7.
//

import SwiftUI
import Kingfisher

extension MallView {
    struct Category: View {
        var title: String = "类别"
        var products: [Product] = []
        var action: ((_ id: String) -> Void)?
        let gridItems = Array(repeating: GridItem(.flexible()), count: 2)
        
        var body: some View {
            VStack {
                HStack {
                    Text(title)
                    Spacer()
                }
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(products, id: \.id) { product in
                        Button(action: {
                            action?("aaa")
                        }) {
                            VStack(alignment: .leading) {
                                if let cover = product.cover {
                                    KFImage(URL(string: cover))
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(5)
                                }
                                Text(product.name)
                                    .font(.system(size: 14))
                                    .padding(.bottom, 1)
                                Text("¥ \(product.price ?? "")")
                                    .font(.system(size: 12))
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(20)
        }
    }
}


#Preview {
    MallView.Category(products: [
        Product.init(id: "1", name: "车载无人机", cover: "https://pic.imgdb.cn/item/65e9b3879f345e8d036bff96.png", price: "1000"),
        Product.init(id: "2", name: "露营帐篷", cover: "https://pic.imgdb.cn/item/65e9b3939f345e8d036c2633.png", price: "500"),
        Product.init(id: "3", name: "车辆模型", cover: "https://pic.imgdb.cn/item/65e9b39f9f345e8d036c4a0a.png", price: "800"),
        Product.init(id: "4", name: "露营帐篷", cover: "https://pic.imgdb.cn/item/65e9b3939f345e8d036c2633.png", price: "550")
    ])
}
