//
//  VehicleView_TopBar.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/22.
//

import SwiftUI

struct VehicleView_TopBar: View {
    var body: some View {
        HStack {
            Text("开源汽车")
                .font(.system(size: 18))
                .bold()
            Image(systemName: "chevron.up.chevron.down")
            Spacer()
            Image(systemName: "qrcode.viewfinder")
            NavigationLink(destination: VehicleSettingView().navigationBarBackButtonHidden()) {
                Image(systemName: "gearshape")
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    VehicleView_TopBar()
}