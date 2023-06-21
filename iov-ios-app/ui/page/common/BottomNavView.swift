//
//  BottomNavBar.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/13.
//

import SwiftUI

struct BottomNavView: View {
    
    @EnvironmentObject var state: AppGlobalState
    
    var body: some View {
        TabView(selection: $state.selectedTab) {
            Text("待解锁")
                .tabItem {
                    if state.selectedTab == 0 {
                        Image(systemName: "lock")
                    } else {
                        Image(systemName: "lock.fill")
                    }
                    Text("探索")
                }
                .tag(0)
            Text("待解锁")
                .tabItem {
                    if state.selectedTab == 1 {
                        Image(systemName: "lock")
                    } else {
                        Image(systemName: "lock.fill")
                    }
                    Text("服务")
                }
                .tag(1)
            Text("待解锁")
                .tabItem {
                    if state.selectedTab == 2 {
                        Image(systemName: "lock")
                    } else {
                        Image(systemName: "lock.fill")
                    }
                    Text("爱车")
                }
                .tag(2)
            Text("待解锁")
                .tabItem {
                    if state.selectedTab == 3 {
                        Image(systemName: "lock")
                    } else {
                        Image(systemName: "lock.fill")
                    }
                    Text("商城")
                }
                .tag(3)
//            MyView()
//                .tabItem {
//                    if state.selectedTab == 4 {
//                        Image(systemName: "person")
//                    } else {
//                        Image(systemName: "person.fill")
//                    }
//                    Text("我的")
//                }
//                .tag(4)
        }
        .accentColor(Color.black)
    }

}
