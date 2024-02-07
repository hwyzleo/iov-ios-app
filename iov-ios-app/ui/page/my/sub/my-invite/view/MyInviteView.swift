//
//  MySettingView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/29.
//

import SwiftUI

struct MyInviteView: View {
    
    @StateObject var container: MviContainer<MyInviteIntentProtocol, MyInviteModelStateProtocol>
    private var intent: MyInviteIntentProtocol { container.intent }
    private var state: MyInviteModelStateProtocol { container.model }
    @EnvironmentObject var appGlobalState: AppGlobalState
    @Environment(\.dismiss) private var dismiss
    @State private var showStack = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                ZStack(alignment: .top) {
                    Image("my-invite-banner")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .leading) {
                        TopBackTitleBar(title: "")
                            .foregroundColor(.white)
                            .padding(.top, 60)
                        Spacer()
                            .frame(height: 80)
                        VStack(alignment: .leading) {
                            Text("邀请好友")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .bold()
                                .padding(.bottom, 30)
                            Text("邀请好友购买开源汽车\n赢取积分好礼，同享幸福里程")
                                .foregroundColor(.black)
                                .font(.system(size: 14))
                                .lineSpacing(5)
                        }
                        .padding(20)
                        GeometryReader { geometry in
                            Color.clear
                                .onChange(of: geometry.frame(in: .global).minY) { value in
                                    showStack = value < 412
                                }
                        }
                        .frame(height: 0)
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {}) {
                                    HStack {
                                        Image("img")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("邀请海报")
                                            .font(.system(size: 14))
                                    }
                                    .padding(10)
                                    .frame(width: 140, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                }
                                .buttonStyle(.plain)
                                Spacer()
                                    .frame(width: 30)
                                Button(action: {}) {
                                    HStack {
                                        Image("qrCode")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("邀请二维码")
                                            .font(.system(size: 14))
                                    }
                                    .padding(10)
                                    .frame(width: 140, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                }
                                .buttonStyle(.plain)
                                Spacer()
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("我的邀请")
                                .foregroundColor(.black)
                                .font(.system(size: 24))
                                .bold()
                                .padding(.bottom, 20)
                            TabMenu()
                        }
                        .padding(20)
                        Spacer()
                    }
                    .onAppear {
                        appGlobalState.currentView = "MyInvite"
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
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
    }
    
}

private extension MyInviteView {
    
    /// 菜单项
    struct TabMenu: View {
        private let segmented = ["邀请中","已完成"]
        @State private var selector = 0
        
        var body: some View{
            VStack{
                ZStack {
                    HStack{
                        ForEach(segmented, id: \.self) { name in
                            Button(action: {
                                if let index = segmented.firstIndex(of: name){
                                    withAnimation {
                                        selector = index
                                    }
                                }
                            }, label: {
                                if selector == segmented.firstIndex(of: name){
                                    Text(name)
                                        .font(.system(size: 14, weight: .bold))
                                        .overlay(Rectangle().frame(height: 2).offset(y: 4) ,alignment: .bottom)
                                        .foregroundColor(.black)
                                }else{
                                    Text(name)
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                }
                            })
                            .padding(.trailing, 10)
                        }
                        Spacer()
                    }
                    Text("")
                        .frame(maxWidth: .infinity)
                        .frame(height: 24)
                        .modifier(BottomLineModifier())
                }
                
                //根据selector分段切换视图
                ScrollView{
                    switch selector{
                    case 0:
                        Inviting()
                    case 1:
                        Inviting()
                    default:
                        Inviting()
                    }
                }
                .offset(x:gesturePanOffset.width)
                .gesture(panGesture())//拖动手势(切换View)
    //            .transition(.slide)
    //            .animation(.easeInOut)
                .navigationBarHidden(true) //隐藏包括标题和返回键在内的所有系统导航栏
                .navigationBarBackButtonHidden(true)//只隐藏系统导航栏中的返回键
            }
        }
        
        //平移手势
        @GestureState private var gesturePanOffset:CGSize = .zero //手势结束会恢复初值
        //手势定义
        private func panGesture() -> some Gesture{
            DragGesture()
                //有空仔细学一下updating到底在做什么
                .updating($gesturePanOffset){ lastestGestureValue, gesturePan, animation in
                    gesturePan = lastestGestureValue.translation //gesturePan的更新会影响$gesturePanOffset的值变化
                    animation.animation = .easeInOut//拖动的动画处理
                }
                //手势结束后的操作(循环切换分段View)
                .onEnded{ value in
                    let moveOffset = UIScreen.main.bounds.width / 2 //超过屏幕宽度（计算后的值）才发生偏移
                    let lastIndex = segmented.endIndex - 1//数组最后一个索引值
                    //向右拖动
                    if value.translation.width > moveOffset{
                        if selector <= 0{
                            selector = lastIndex
                        }else{
                            selector -= 1
                        }
                    }
                    //向左拖动
                    if -value.translation.width > moveOffset{
                        if selector >= lastIndex {
                            selector = 0
                        }else{
                            selector += 1
                        }
                    }
                }
        }
    }
    
    /// 邀请中
    struct Inviting: View {
        
        var body: some View {
            Spacer()
                .frame(height: 20)
            VStack(alignment: .leading) {
                HStack {
                    Text("微信用户")
                        .bold()
                        .font(.system(size: 14))
                    Spacer()
                    Text("已邀请")
                        .foregroundColor(.brown)
                        .bold()
                        .font(.system(size: 14))
                }
                .padding(.bottom, 5)
                Text("13xxxxxxxxx")
                    .font(.system(size: 14))
                HStack {
                    ZStack(alignment: .top) {
                        Text("")
                            .frame(maxWidth: .infinity)
                            .frame(height: 2)
                            .modifier(BottomLineModifier())
                            .padding(.leading, 35)
                            .padding(.trailing, 35)
                            .padding(.top, 13)
                        HStack(alignment: .top) {
                            VStack {
                                Circle()
                                    .foregroundColor(.brown)
                                    .frame(width: 10, height: 10)
                                    .padding(.bottom, 5)
                                Text("邀请")
                                    .font(.system(size: 12))
                                    .foregroundColor(.brown)
                                    .padding(.bottom, 2)
                                Text("2023/08/22")
                                    .frame(width: 80)
                                    .foregroundColor(.brown)
                                    .font(.system(size: 10))
                            }
                            Spacer()
                            VStack {
                                Circle()
                                    .foregroundColor(.gray)
                                    .frame(width: 10, height: 10)
                                    .padding(.bottom, 5)
                                Text("试驾")
                                    .font(.system(size: 12))
                                    .padding(.bottom, 2)
                                Text("")
                                    .frame(width: 80)
                                    .font(.system(size: 10))
                            }
                            Spacer()
                            VStack {
                                Circle()
                                    .foregroundColor(.gray)
                                    .frame(width: 10, height: 10)
                                    .padding(.bottom, 5)
                                Text("订购")
                                    .font(.system(size: 12))
                                    .padding(.bottom, 2)
                                Text("")
                                    .frame(width: 80)
                                    .font(.system(size: 10))
                            }
                            Spacer()
                            VStack {
                                Circle()
                                    .foregroundColor(.gray)
                                    .frame(width: 10, height: 10)
                                    .padding(.bottom, 5)
                                Text("支付")
                                    .font(.system(size: 12))
                                    .padding(.bottom, 2)
                                Text("")
                                    .frame(width: 80)
                                    .font(.system(size: 10))
                            }
                        }
                        .padding(.top, 10)
                    }
                }
                Text("")
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .modifier(BottomLineModifier())
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                Text("您的好友已接受邀请，好友完成试驾或提车后您可以获得积分奖励。")
                    .font(.system(size: 13))
            }
            .padding(10)
            .foregroundColor(.black)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        
    }
}

struct MyInviteView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        MyInviteView(container: MyInviteView.buildContainer())
            .environmentObject(appGlobalState)
    }
}
