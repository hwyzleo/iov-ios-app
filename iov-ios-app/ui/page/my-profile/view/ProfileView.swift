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
        NavigationView {
            ZStack {
                switch state.contentState {
                case .loading:
                    LoadingContent(text: state.loadingText)
                case .content:
                    Profile(intent: intent, state: state)
                case .nickname:
                    Nickname(intent: intent, state: state)
                case .gender:
                    Gender(intent: intent, state: state)
                case let .error(text):
                    ErrorContent(text: text)
                }
            }
            .onAppear(perform: intent.viewOnAppear)
//            .modifier(ProfileRouter())
        }
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
    
    struct Profile: View {
        let intent: ProfileIntentProtocol
        let state: ProfileModelStateProtocol
        
        var body: some View {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.top, 40)
                    .padding(.bottom, 60)
                ContentList(title: "昵称", content: state.nickname) {
                    Nickname(intent: intent, state: state)
                }
                ContentList(title: "性别", content: genderStr(state.gender)) {
                    Nickname(intent: intent, state: state)
                }
//                ContentList(title: "生日", content: "1982/10/13", destination: TextFieldItem(value: $viewModel.viewState.nickname, isItemView: $viewModel.viewState.isItemView))
//                ContentList(title: "地区", content: "上海 长宁", destination: TextFieldItem(value: $viewModel.viewState.nickname, isItemView: $viewModel.viewState.isItemView))
                Spacer()
            }
        }
    }
    
    private struct Nickname: View {
        let intent: ProfileIntentProtocol
        let state: ProfileModelStateProtocol
        @State var nickname: String
        
        init(intent: ProfileIntentProtocol, state: ProfileModelStateProtocol) {
            self.intent = intent;
            self.state = state;
            _nickname = State(initialValue: state.nickname)
        }
        
        var body: some View {
            VStack {
                TextFieldItem(value: $nickname) {
                    intent.modifyNickname(nickname: nickname)
                }
                Spacer()
            }
        }
    }
    
    private struct Gender: View {
        let intent: ProfileIntentProtocol
        let state: ProfileModelStateProtocol
        @State var gender: String
        
        init(intent: ProfileIntentProtocol, state: ProfileModelStateProtocol) {
            self.intent = intent;
            self.state = state;
            _gender = State(initialValue: state.gender)
        }
        
        var body: some View {
            GenderPickerItem(selectedGender: $gender, title: "性别") {
                intent.modifyGender(gender: gender)
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
        ProfileView.Profile(intent: intent, state: model)
    }
}
