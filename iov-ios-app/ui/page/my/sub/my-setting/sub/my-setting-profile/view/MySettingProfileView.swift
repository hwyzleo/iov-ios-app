//
//  ProfileView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import SwiftUI

struct MySettingProfileView: View {
    @StateObject var container: MviContainer<MySettingProfileIntentProtocol, MySettingProfileModelStateProtocol>
    private var intent: MySettingProfileIntentProtocol { container.intent }
    private var state: MySettingProfileModelStateProtocol { container.model }
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                LoadingTip()
            case .content:
                Content(intent: intent, state: state)
            case let .error(text):
                ErrorTip(text: text)
            }
        }
        .onAppear(perform: intent.viewOnAppear)
        .modifier(MySettingProfileRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

// MARK: - Views

private extension MySettingProfileView {
    
    private struct Content: View {
        let intent: MySettingProfileIntentProtocol
        let state: MySettingProfileModelStateProtocol
        @State private var image: Image? = nil
        @State private var showBirthday = false
        @State private var selectedDate = Date()
        @EnvironmentObject var appGlobalState: AppGlobalState
        
        var body: some View {
            VStack {
                TopBackTitleBar(title: "个人资料") {
                    intent.onTapBackSetting()
                }
                Spacer()
                    .frame(height: 50)
                MySettingProfileView.AvatarContent(intent: intent)
                ContentList(title: "昵称", content: state.nickname) {
                    intent.onTapNickname()
                }
                ContentList(title: "性别", content: genderStr(state.gender)) {
                    intent.onTapGender()
                }
                ContentList(title: "生日", content: dateToStr(date: state.birthday)) {
                    showBirthday = true
                }
                ContentList(title: "地区", content: state.area) {
                    intent.onTapArea()
                }
                Spacer()
            }
            .onAppear {
                selectedDate = state.birthday
                appGlobalState.currentView = "MySettingProfile"
            }
            .sheet(isPresented: $showBirthday) {
                VStack {
                    TopCloseTitleBar(title: "生日") {
                        showBirthday = false
                    }
                    VStack(alignment: .center) {
                        DatePicker("选择日期", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            .environment(\.locale, Locale(identifier: "zh_CN"))
                        Button("保存") {
                            intent.onTapBirthdaySaveButton(date: selectedDate)
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(22.5)
                        .contentShape(Rectangle())
                        Spacer()
                    }
                }
                .padding(20)
                .presentationDetents([.height(350)])
            }
        }
    }
    
    private struct AvatarContent: View {
        let intent: MySettingProfileIntentProtocol
        @State var showImagePicker: Bool = false
        @State var image: UIImage?
        @AppStorage("userAvatar") private var userAvatar: String = ""
        var body: some View {
            VStack {
                if userAvatar.count > 0 {
                    Button(action: { self.showImagePicker.toggle() }) {
                        AsyncImage(url: URL(string: userAvatar)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.white
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .aspectRatio(contentMode: .fit)
                    }
                } else {
                    Button(action: { self.showImagePicker.toggle() }) {
                        Image("myPlaceHolder")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .padding(.top, 30)
                            .padding(.bottom, 40)
                    }
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: .photoLibrary) { image in
                    self.image = image
                    intent.onSelectAvatar(image: image)
                }
            }
        }
    }
    
}


struct MySettingProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MySettingProfileView(container: MySettingProfileView.buildContainer())
    }
}
