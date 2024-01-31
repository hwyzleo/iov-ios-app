//
//  MySettingProfileNicknameView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/1/30.
//

import SwiftUI

struct MySettingProfileGenderView: View {
    
    @StateObject var container: MviContainer<MySettingProfileGenderIntentProtocol, MySettingProfileGenderModelStateProtocol>
    private var intent: MySettingProfileGenderIntentProtocol { container.intent }
    private var state: MySettingProfileGenderModelStateProtocol { container.model }
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                LoadingTip(text: state.loadingText)
            case .content:
                Content(intent: intent, state: state)
            case let .error(text):
                ErrorTip(text: text)
            }
        }
        .onAppear(perform: intent.viewOnAppear)
        .modifier(MySettingProfileGenderRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

private extension MySettingProfileGenderView {
    
    private struct Content: View {
        let intent: MySettingProfileGenderIntentProtocol
        let state: MySettingProfileGenderModelStateProtocol
        @State var selectedGender: String = ""
        @State var showMale = false
        @State var showFemale = false
        
        var body: some View {
            VStack {
                TopBackTitleBar(title: "性别") {
                    intent.onTapBackProfile()
                }
                VStack(alignment: .center) {
                    Button(action: {
                        showMale = true
                        showFemale = false
                        selectedGender = "MALE"
                    }) {
                        VStack {
                            HStack {
                                Text("男")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 10)
                                if showMale {
                                    Image("tick")
                                }
                            }
                            .padding(.bottom, 30)
                            .padding(.top, 20)
                            .modifier(BottomLineModifier())
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    Button(action: {
                        showFemale = true
                        showMale = false
                        selectedGender = "FEMALE"
                    }) {
                        VStack {
                            HStack {
                                Text("女")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 10)
                                if showFemale {
                                    Image("tick")
                                }
                            }
                            .padding(.bottom, 30)
                            .padding(.top, 20)
                            .modifier(BottomLineModifier())
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    Button("保存") {
                        intent.onTapGenderSaveButton(gender: selectedGender)
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(22.5)
                    .padding(.top, 20)
                    .contentShape(Rectangle())
                    Spacer()
                }
                .padding(20)
            }
            .onAppear(perform: {
                selectedGender = state.gender
                if selectedGender == "MALE" {
                    showMale = true
                    showFemale = false
                } else {
                    showFemale = true
                    showMale = false
                }
            })
        }
    }
}

struct MySettingProfileGenderView_Previews: PreviewProvider {
    static var previews: some View {
        MySettingProfileGenderView(container: MySettingProfileGenderView.buildContainer())
    }
}
