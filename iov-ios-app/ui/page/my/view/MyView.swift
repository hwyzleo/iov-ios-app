//
//  ProfileView.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

import SwiftUI

struct MyView: View {
    
    @StateObject var container: MviContainer<MyIntentProtocol, MyModelStateProtocol>
    private var intent: MyIntentProtocol { container.intent }
    private var state: MyModelStateProtocol { container.model }
    
    var body: some View {
        if(User.isLogin()) {
            MyView_Login(container: container, user: User.getUser()!)
        } else {
            MyView_NotLogin(container: container)
        }
    }
}

// MARK: - 顶部条

struct TopBar: View {
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "qrcode")
                        .padding(.trailing, 20)
                }
                .foregroundColor(.black)
                Button(action: {
                    
                }) {
                    Image(systemName: "ellipsis.viewfinder")
                        .padding(.trailing, 30)
                }
                .foregroundColor(.black)
            }
        }
    }
}

// MARK: - 头像

struct MyAvatar: View {
    var title: String
    var avatar: String
    var action: (() -> Void)?
    var body: some View {
        Button(action: { action?() }) {
            VStack {
                if !avatar.isEmpty {
                    AsyncImage(url: URL(string: avatar)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.white
                    }
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 80)
                } else {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding(.top, 80)
                }
                Text(title)
                    .padding()
                    .font(.system(size: 20))
                Spacer()
                    .frame(height: 20)
            }.foregroundColor(.black)
        }
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
