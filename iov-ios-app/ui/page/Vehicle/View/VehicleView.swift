//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct VehicleView: View {
    
    @StateObject var container: MviContainer<VehicleIntentProtocol, VehicleModelStateProtocol>
    private var intent: VehicleIntentProtocol { container.intent }
    private var state: VehicleModelStateProtocol { container.model }
    @EnvironmentObject var appGlobalState: AppGlobalState
    
    var body: some View {
        VStack {
            VehicleView_TopBar()
                .padding(.leading, 20)
                .padding(.trailing, 20)
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "car.front.waves.up")
                            .font(.system(size: 14))
                        Image(systemName: "key.radiowaves.forward")
                            .font(.system(size: 14))
                        Text("停放中")
                            .font(.system(size: 14))
                            .bold()
                        Divider()
                        Text("无法获取位置")
                            .font(.system(size: 14))
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 50)
                    HStack {
                        Text("998")
                            .font(.system(size: 50))
                            .bold()
                        VStack(alignment: .leading) {
                            Text("km")
                                .font(.system(size: 16))
                            Text("WLTC")
                                .font(.system(size: 14))
                        }
                    }
                    HStack {
                        VStack {
                            HStack(alignment: .bottom) {
                                Image(systemName: "bolt.fill")
                                    .font(.system(size: 14))
                                    .foregroundColor(.green)
                                Text("102")
                                    .font(.system(size: 18))
                                Text("km")
                                    .font(.system(size: 12))
                                Divider()
                                    .font(.system(size: 12))
                                Text("70%")
                                    .font(.system(size: 12))
                            }
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .frame(width:100, height: 3)
                                    .foregroundColor(.gray)
                                Rectangle()
                                    .frame(width:80, height: 3)
                                    .foregroundColor(.green)
                            }
                        }
                        Spacer()
                        VStack {
                            HStack(alignment: .bottom) {
                                Image(systemName: "drop.fill")
                                    .font(.system(size: 14))
                                    .foregroundColor(.blue)
                                Text("252")
                                    .font(.system(size: 18))
                                Text("km")
                                    .font(.system(size: 12))
                                Divider()
                                    .font(.system(size: 12))
                                Text("25%")
                                    .font(.system(size: 12))
                            }
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .frame(width:100, height: 3)
                                    .foregroundColor(.gray)
                                Rectangle()
                                    .frame(width:80, height: 3)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    Spacer()
                        .frame(height: 50)
                    HStack {
                        Image("VehicleModel")
                            .resizable()
                            .scaledToFit()
                    }
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    Spacer()
                        .frame(height: 30)
                    HStack {
                        VStack {
                            Button(action: {}) {
                                Image(systemName: "lock")
                                    .font(.system(size: 20))
                            }
                            .frame(width: 45, height: 45)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                            .buttonStyle(.plain)
                            Spacer()
                                .frame(height: 15)
                            Text("车锁")
                                .font(.system(size: 14))
                        }
                        Spacer()
                        VStack {
                            Button(action: {}) {
                                Image(systemName: "car.window.left")
                                    .font(.system(size: 20))
                            }
                            .frame(width: 45, height: 45)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                            .buttonStyle(.plain)
                            Spacer()
                                .frame(height: 15)
                            Text("车窗")
                                .font(.system(size: 14))
                        }
                        Spacer()
                        VStack {
                            Button(action: {}) {
                                Image(systemName: "suv.side.rear.open")
                                    .font(.system(size: 15))
                            }
                            .frame(width: 45, height: 45)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                            .buttonStyle(.plain)
                            Spacer()
                                .frame(height: 15)
                            Text("尾门")
                                .font(.system(size: 14))
                        }
                        Spacer()
                        VStack {
                            Button(action: {}) {
                                Image(systemName: "horn.blast")
                                    .font(.system(size: 15))
                            }
                            .frame(width: 45, height: 45)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                            .buttonStyle(.plain)
                            Spacer()
                                .frame(height: 15)
                            Text("寻车")
                                .font(.system(size: 14))
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                Spacer()
                    .frame(height: 20)
                VStack {
                    VStack {
                        HStack {
                            Text("常用功能")
                                .font(.system(size: 16))
                                .bold()
                            Spacer()
                            Text("全部功能和服务 >")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        HStack {
                            VStack {
                                Image(systemName: "car.top.lane.dashed.badge.steeringwheel")
                                    .font(.system(size: 34))
                                Text("智驾学习")
                                    .font(.system(size: 14))
                            }
                            Spacer()
                            VStack {
                                Image(systemName: "key")
                                    .font(.system(size: 30))
                                Text("蓝牙钥匙")
                                    .font(.system(size: 14))
                            }
                            Spacer()
                            VStack {
                                Image(systemName: "figure.child.and.lock")
                                    .font(.system(size: 34))
                                Text("车辆授权")
                                    .font(.system(size: 14))
                            }
                        }
                        .padding(20)
                    }
                    .padding(10)
                    .background(.white)
                    .cornerRadius(5)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                Spacer()
                    .frame(height: 20)
                VStack {
                    VStack {
                        HStack {
                            Text("空调和座椅")
                                .font(.system(size: 16))
                                .bold()
                            Spacer()
                            Text("全部设置 >")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                            .frame(height: 20)
                        HStack {
                            Text("24")
                                .font(.system(size: 28))
                            Text("℃")
                        }
                        Text("车内温度")
                            .font(.system(size: 14))
                        HStack {
                            VStack {
                                Button(action: {}) {
                                    VStack {
                                        Image(systemName: "sun.max")
                                            .font(.system(size: 22))
                                        Text("极速升温")
                                            .font(.system(size: 12))
                                        Text("HI")
                                            .font(.system(size: 12))
                                    }
                                }
                                .frame(width: 80, height: 80)
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                .buttonStyle(.plain)
                            }
                            Spacer()
                            VStack {
                                Button(action: {}) {
                                    VStack {
                                        Image(systemName: "snowflake")
                                            .font(.system(size: 22))
                                        Text("极速降温")
                                            .font(.system(size: 12))
                                        Text("LO")
                                            .font(.system(size: 12))
                                    }
                                }
                                .frame(width: 80, height: 80)
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                .buttonStyle(.plain)
                            }
                            Spacer()
                            VStack {
                                Button(action: {}) {
                                    VStack {
                                        Image(systemName: "thermometer.medium")
                                            .font(.system(size: 22))
                                        Text("一键舒适")
                                            .font(.system(size: 12))
                                        Text("24℃")
                                            .font(.system(size: 12))
                                    }
                                }
                                .frame(width: 80, height: 80)
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(20)
                    }
                    .padding(10)
                    .background(.white)
                    .cornerRadius(5)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                Spacer()
                    .frame(height: 20)
                VStack {
                    VStack {
                        HStack {
                            Text("车辆中心")
                                .font(.system(size: 16))
                                .bold()
                            Spacer()
                            Text("查看详情 >")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
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
                        .padding(20)
                    }
                    .padding(10)
                    .background(.white)
                    .cornerRadius(5)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
            .scrollIndicators(.hidden)
        }
        .background(Color(hex: 0xf8f8f8))
        .onAppear {
            intent.viewOnAppear()
            appGlobalState.currentView = "Vehicle"
        }
        .modifier(VehicleRouter(
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

struct VehicleView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        VehicleView(container: VehicleView.buildContainer())
            .environmentObject(appGlobalState)
    }
}
