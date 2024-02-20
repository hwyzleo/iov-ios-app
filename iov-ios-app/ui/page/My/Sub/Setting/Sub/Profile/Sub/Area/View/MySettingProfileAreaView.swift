//
//  MySettingProfileNicknameView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI
import CoreLocation

struct MySettingProfileAreaView: View {
    
    @StateObject var container: MviContainer<MySettingProfileAreaIntentProtocol, MySettingProfileAreaModelStateProtocol>
    private var intent: MySettingProfileAreaIntentProtocol { container.intent }
    private var state: MySettingProfileAreaModelStateProtocol { container.model }
    @EnvironmentObject var appGlobalState: AppGlobalState
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                LoadingTip()
            case .province:
                Province(intent: intent, state: state)
            case .city:
                City(intent: intent, state: state)
            case let .error(text):
                ErrorTip(text: text)
            }
        }
        .onAppear {
            intent.viewOnAppear()
            appGlobalState.currentView = "MySettingProfileArea"
        }
        .modifier(MySettingProfileAreaRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

private extension MySettingProfileAreaView {
    
    private struct Province: View {
        let intent: MySettingProfileAreaIntentProtocol
        let state: MySettingProfileAreaModelStateProtocol
        @StateObject var locationManager = LocationManager()
        @State private var locationArea = "点击重试"
        
        class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
            let manager = CLLocationManager()

            @Published var location: CLLocationCoordinate2D?

            override init() {
                super.init()
                manager.delegate = self
            }

            func requestLocation() {
                manager.requestLocation()
            }
            
            func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
                 print("error:: \(error.localizedDescription)")
            }
            
            func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
                if status == .authorizedWhenInUse {
                    requestLocation()
                }
            }

            func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                location = locations.first?.coordinate
            }
        }
        
        
        
        var body: some View {
            VStack {
                TopBackTitleBar(title: "地区") {
                    intent.onTapBackProfile()
                }
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("当前位置")
                            .foregroundColor(.gray)
                        Button(action: {
                            self.locationManager.requestLocation()
                            if let location = self.locationManager.location {
                                locationArea = "\(location.latitude), \(location.longitude)"
                            }
                        }) {
                            VStack {
                                HStack {
                                    Image("location")
                                    Text(locationArea)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 10)
                                }
                                .padding(.bottom, 30)
                                .padding(.top, 20)
                                .modifier(BottomLineModifier())
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                        Spacer()
                            .frame(height: 50)
                        Text("国内其他区域")
                            .foregroundColor(.gray)
                        ForEach(Provinces.sorted(by: { $0.key < $1.key }), id: \.key) { province in
                            Button(action: {
                                intent.onTapProvince(province: province.key)
                            }) {
                                VStack {
                                    HStack {
                                        Text(province.value)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.leading, 10)
                                    }
                                    .padding(.bottom, 30)
                                    .padding(.top, 20)
                                    .modifier(BottomLineModifier())
                                }
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(20)
                }
                .edgesIgnoringSafeArea(.top)
            }
        }
    }
    
    private struct City: View {
        let intent: MySettingProfileAreaIntentProtocol
        let state: MySettingProfileAreaModelStateProtocol
        
        var body: some View {
            VStack {
                TopBackTitleBar(title: "地区") {
                    intent.onTapBackProvince()
                }
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(Cities.sorted(by: { $0.key < $1.key }), id: \.key) { city in
                            if city.key.hasPrefix(state.province) {
                                Button(action: {
                                    intent.onTapCity(city: city.key)
                                }) {
                                    VStack {
                                        HStack {
                                            Text(city.value)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading, 10)
                                        }
                                        .padding(.bottom, 30)
                                        .padding(.top, 20)
                                        .modifier(BottomLineModifier())
                                    }
                                    .contentShape(Rectangle())
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        Spacer()
                    }
                    .padding(20)
                }
                .edgesIgnoringSafeArea(.top)
            }
            .onAppear(perform: {

            })
        }
    }
}

struct MySettingProfileAreaView_Previews: PreviewProvider {
    static var previews: some View {
        MySettingProfileAreaView(container: MySettingProfileAreaView.buildContainer())
    }
}
