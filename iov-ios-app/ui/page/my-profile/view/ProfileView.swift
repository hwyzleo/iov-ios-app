//
//  ProfileView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var container: MviContainer<ProfileIntentProtocol, ProfileModelStateProtocol>
    private var intent: ProfileIntentProtocol { container.intent }
    private var state: ProfileModelStateProtocol { container.model }
    
    var body: some View {
        ZStack {
            switch state.contentState {
            case .loading:
                LoadingContent(text: state.loadingText)
            case .content:
                ProfileContent(intent: intent, state: state)
            case let .nickname(nickname):
                NicknameContent(intent: intent, nickname: nickname)
                    .navigationBarHidden(true)
            case let .gender(gender):
                GenderContent(intent: intent, gender: gender)
            case let .error(text):
                ErrorContent(text: text)
            }
        }
        .onAppear(perform: intent.viewOnAppear)
        .modifier(ProfileRouter(
            subjects: state.routerSubject,
            intent: intent
        ))
    }
}

// MARK: - Views

private extension ProfileView {
    
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
        let intent: ProfileIntentProtocol
        let state: ProfileModelStateProtocol
        
        var body: some View {
            VStack {
                TopBackBar()
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.top, 30)
                    .padding(.bottom, 40)
                ContentList(title: "昵称", content: state.nickname) {
                    intent.onTapNickname(nickname: state.nickname)
                }
                ContentList(title: "性别", content: genderStr(state.gender)) {
                    intent.onTapGender(gender: state.gender)
                }
                ContentList(title: "生日", content: "1982/10/13") {
                    
                }
//                ContentList(title: "地区", content: "上海 长宁", destination: TextFieldItem(value: $viewModel.viewState.nickname, isItemView: $viewModel.viewState.isItemView))
                Spacer()
            }
        }
    }
    
    private struct NicknameContent: View {
        let intent: ProfileIntentProtocol
        @State var nickname: String
        var body: some View {
            VStack {
                TopBackBar() {
                    intent.onTapBackProfile()
                }
                TextFieldItem(value: $nickname) {
                    intent.onTapNicknameSaveButton(nickname: nickname)
                }
                Spacer()
            }
        }
    }
    
    private struct GenderContent: View {
        let intent: ProfileIntentProtocol
        @State var gender: String
        
        var body: some View {
            VStack {
                TopBackBar() {
                    intent.onTapBackProfile()
                }
                GenderPickerItem(selectedGender: $gender, title: "性别") {
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


struct ProfileView_Previews: PreviewProvider {
    @State static var model = ProfileModel()
    @State static var intent = ProfileIntent(model: model)
    static var previews: some View {
        ProfileView.ProfileContent(intent: intent, state: model)
    }
}
