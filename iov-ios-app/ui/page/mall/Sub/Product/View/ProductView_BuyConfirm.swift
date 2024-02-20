//
//  ProductView_BuyConfirm.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/19.
//

import SwiftUI
extension ProductView {
    
    struct BuyConfirm: View {
        let state: ProductModelStateProtocol
        let intent: ProductIntentProtocol
        @Environment(\.dismiss) private var dismiss
        
        var body: some View {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image("MallBanner1")
                            .resizable()
                            .frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
                            Text("¥ 1,000")
                                .font(.system(size: 20))
                                .padding(.bottom, 50)
                            HStack {
                                Text("已选")
                                    .font(.system(size: 14))
                                Text("x1")
                                    .font(.system(size: 14))
                            }
                        }
                    }
                    Text("数量")
                        .font(.system(size: 14))
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    HStack {
                        Image(systemName: "minus.circle")
                        Text("\(state.buyCount)")
                        Image(systemName: "plus.circle")
                    }
                    Spacer()
                    Button(action: {
                        dismiss()
                        intent.onTapBuyButton()
                    }) {
                        Text("立即购买")
                            .font(.system(size: 12))
                    }
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(22.5)
                }
            }
            .padding(20)
        }
    }
}


struct ProductView_BuyConfirm_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        ProductView.buildBuyConfirm()
            .environmentObject(appGlobalState)
    }
}
