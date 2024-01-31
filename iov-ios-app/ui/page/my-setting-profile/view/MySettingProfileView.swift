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
                LoadingContent(text: state.loadingText)
            case .content:
                ProfileContent(intent: intent, state: state)
            case .gender:
                GenderContent(intent: intent, gender: state.gender)
            case let .error(text):
                ErrorContent(text: text)
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
    
    // MARK: Loading View
    
    private struct LoadingContent: View {
        let text: String

        var body: some View {
            ZStack {
                Color.white
                Text(text)
            }
        }
    }
    
    // MARK: Profile View
    
    struct ProfileContent: View {
        let intent: MySettingProfileIntentProtocol
        let state: MySettingProfileModelStateProtocol
        @State private var image: Image? = nil
        
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
                ContentList(title: "生日", content: "1982/10/13") {
                    
                }
                ContentList(title: "地区", content: "上海 长宁") {
                    
                }
                Spacer()
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
    
    private struct GenderContent: View {
        let intent: MySettingProfileIntentProtocol
        @State var gender: String
        
        var body: some View {
            VStack {
                TopBackTitleBar() {
                    intent.onTapBackProfile()
                }
                GenderPicker(selectedGender: $gender, title: "性别") {
                    intent.modifyGender(gender: gender)
                }
                Spacer()
            }
            Spacer()
        }
    }
    
    // MARK: Error View
    
    private struct ErrorContent: View {
        let text: String

        var body: some View {
            ZStack {
                Color.white
                Text(text)
            }
        }
    }
    
}


struct MySettingProfileView_Previews: PreviewProvider {
    @State static var model = MySettingProfileModel()
    @State static var intent = MySettingProfileIntent(model: model)
    static var previews: some View {
        MySettingProfileView.ProfileContent(intent: intent, state: model)
    }
}
