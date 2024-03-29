//
//  VehicleCenterView_VehicleStatus.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/23.
//

import SwiftUI

struct VehicleCenterView_VehicleStatus: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 150)
            HStack {
                VStack(alignment: .leading) {
                    Text("2 bar")
                    Divider()
                    Text("50℃")
                    Spacer()
                        .frame(height: 60)
                    Text("2 bar")
                    Divider()
                    Text("50℃")
                }
                Image("VehicleModel2")
                VStack(alignment: .trailing) {
                    Text("2 bar")
                    Divider()
                    Text("50℃")
                    Spacer()
                        .frame(height: 60)
                    Text("2 bar")
                    Divider()
                    Text("50℃")
                }
            }
            Spacer()
                .frame(height: 100)
            Text("车辆状态良好")
                .font(.system(size: 25))
        }
        .padding(20)
    }
}

#Preview {
    VehicleCenterView_VehicleStatus()
}
