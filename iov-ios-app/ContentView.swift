//
//  ContentView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BottomNavView()
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        ContentView()
            .environmentObject(appGlobalState)
    }
}
