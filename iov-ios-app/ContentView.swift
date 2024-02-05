//
//  ContentView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/15.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var globalState: AppGlobalState
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $globalState.selectedTab) {
                    Text("待解锁")
                        .tabItem {
                            if globalState.selectedTab == 0 {
                                Image(systemName: "lock")
                            } else {
                                Image(systemName: "lock.fill")
                            }
                            Text("探索")
                        }
                        .tag(0)
                    Text("待解锁")
                        .tabItem {
                            if globalState.selectedTab == 1 {
                                Image(systemName: "lock")
                            } else {
                                Image(systemName: "lock.fill")
                            }
                            Text("服务")
                        }
                        .tag(1)
                    Text("待解锁")
                        .tabItem {
                            if globalState.selectedTab == 2 {
                                Image("vehicle")
                            } else {
                                Image(systemName: "lock.fill")
                            }
                            Text("爱车")
                        }
                        .tag(2)
                    Text("待解锁")
                        .tabItem {
                            if globalState.selectedTab == 3 {
                                Image("mall")
                            } else {
                                Image(systemName: "lock.fill")
                            }
                            Text("商城")
                        }
                        .tag(3)
                    MyView.build()
                        .tabItem {
                            if globalState.selectedTab == 4 {
                                Image(systemName: "person")
                            } else {
                                Image(systemName: "person.fill")
                            }
                            Text("我的")
                        }
                        .tag(4)
                }
                .accentColor(Color.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        ContentView()
            .environmentObject(appGlobalState)
    }
}
