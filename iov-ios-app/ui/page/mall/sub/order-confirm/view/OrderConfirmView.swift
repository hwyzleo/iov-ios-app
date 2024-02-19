//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct OrderConfirmView: View {
    
    @StateObject var container: MviContainer<OrderConfirmIntentProtocol, OrderConfirmModelStateProtocol>
    private var intent: OrderConfirmIntentProtocol { container.intent }
    private var state: OrderConfirmModelStateProtocol { container.model }
    @EnvironmentObject var appGlobalState: AppGlobalState
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TopBackTitleBar(title: "确认订单")
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 20)
                    Button(action: {
                        intent.onTapAddress()
                    }) {
                        HStack {
                            Text("请添加收货地址")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .buttonStyle(.plain)
                    Spacer()
                        .frame(height: 30)
                    Rectangle()
                        .frame(height: 0.5)
                        .modifier(BottomLineModifier())
                    Spacer()
                        .frame(height: 30)
                    HStack {
                        Text("商品信息")
                        Spacer()
                    }
                    HStack {
                        Image("MallBanner1")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        VStack(alignment: .leading) {
                            Text("车载无人机")
                            Spacer()
                                .frame(height: 50)
                            HStack {
                                Text("¥ 1,000")
                                Spacer()
                                Text("x1")
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        Text("商品总额")
                        Spacer()
                        Text("¥ 1,000")
                    }
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        Text("运费")
                        Spacer()
                        Text("¥ 0")
                    }
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        Text("优惠券")
                        Spacer()
                        Text("暂无优惠券")
                        Image(systemName: "chevron.right")
                    }
                    Spacer()
                        .frame(height: 20)
                    Rectangle()
                        .frame(height: 0.5)
                        .modifier(BottomLineModifier())
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        Text("支付方式")
                        Spacer()
                        Text("积分余额 9")
                    }
                    Spacer()
                        .frame(height: 20)
                    Button(action: {
                        
                    }) {
                        HStack {
                            Text("现金支付")
                            Spacer()
                            Text("¥ 1,000")
                        }
                        .padding(10)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                    }
                    .buttonStyle(.plain)
                    Spacer()
                        .frame(height: 20)
                    Button(action: {
                        
                    }) {
                        HStack {
                            Text("积分支付")
                            Spacer()
                            Image("diamond")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("10")
                        }
                        .padding(10)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                    }
                    .buttonStyle(.plain)
                    Spacer()
                        .frame(height: 20)
                    Rectangle()
                        .frame(height: 0.5)
                        .modifier(BottomLineModifier())
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        Text("备注")
                        Spacer()
                    }
                    TextEditor(text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 100)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                }
                .padding(20)
            }
            HStack {
                Text("¥ 1,000")
                    .font(.system(size: 18))
                    .bold()
                Spacer()
                Button(action: {

                }) {
                    Text("确认购买")
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
        .onAppear {
            intent.viewOnAppear()
            appGlobalState.currentView = "OrderConfirm"
        }
        .modifier(OrderConfirmRouter(
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

struct OrderConfirmView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        OrderConfirmView(container: OrderConfirmView.buildContainer())
            .environmentObject(appGlobalState)
    }
}
