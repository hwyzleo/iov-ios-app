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
                            action?(product.id)
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
                                if let price = product.price {
                                    Text("¥ \(price)")
                                        .font(.system(size: 12))
                                }
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, 10)
            .padding(.bottom, 10)
        }
    }
}


#Preview {
    ForEach(mockMallIndex().categories.sorted(by: {$0.key < $1.key}), id:\.key) { title, products in
        MallView.Category(title: title, products: products)
    }
}
