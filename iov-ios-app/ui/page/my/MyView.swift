//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct MyView: View {
    @EnvironmentObject var state: AppGlobalState
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                if(!isLoggedIn) {
                    NavigationLink(destination: LoginView()) {
                        VStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .padding(.top, 60)
                            Text("注册/登录")
                                .padding()
                                .font(.system(size: 20))
                            Spacer()
                                .frame(height: 20)
                        }.foregroundColor(.black)
                      }
                }
                VStack {
                    HStack {
                        Image(systemName: "circle.square.fill")
                            .padding(.leading, 30)
                        Text("我的积分")
                            .padding(.leading, 10)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 30)
                    }.padding(.bottom, 20)
                    HStack {
                        Image(systemName: "bag.fill")
                            .padding(.leading, 30)
                        Text("我的订单")
                            .padding(.leading, 10)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 30)
                    }.padding(.bottom, 20)
                }
                Spacer()
                    .frame(height: 20)
                VStack {
                    HStack {
                        Image(systemName: "gearshape.fill")
                            .padding(.leading, 30)
                        Text("设置")
                            .padding(.leading, 10)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 30)
                    }.padding(.bottom, 20)
                    if(isLoggedIn) {
                        Button(action: {
                            AppUserUtil.logout()
                            self.isLoggedIn.toggle()
                        }) {
                            HStack {
                                Image(systemName: "gearshape.fill")
                                    .padding(.leading, 30)
                                Text("退出")
                                    .padding(.leading, 10)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 30)
                            }.padding(.bottom, 20)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    @StateObject static var appGlobalState = AppGlobalState()
    static var previews: some View {
        MyView().environmentObject(appGlobalState)
    }
}
