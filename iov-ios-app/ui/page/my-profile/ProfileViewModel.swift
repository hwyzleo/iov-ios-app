//
//  ProfileViewModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/20.
//
import Foundation
import SwiftUI

class ProfileViewModel: BaseViewModel<ProfileIntent, ProfileAction, ProfileState> {
    
    @AppStorage("nickname") private var nickname = ""
    
    init() {
        super.init(viewState: ProfileState())
    }
    
    override func dispatch(intent: ProfileIntent) {
        let action = actionFromIntent(intent: intent)
        executeAction(action: action)
    }
    
//    override func actionFromIntent(intent: ProfileIntent) -> ProfileAction {
//        switch(intent) {
//        case .Init:
//            return ProfileAction.Init
//        case .ModifyNickname(let nickname):
//            return ProfileAction.ModifyNickname(nickname)
//        case .ModifyGender(let gender):
//            return ProfileAction.ModifyGender(gender)
//        }
//    }
    
    override func executeAction(action: ProfileAction) {
        switch(action) {
        case .Init:
            loadState()
        case .ModifyNickname(let nickname):
            modifyNickname(nickname: nickname)
        case .ModifyGender(let gender):
            modifyGender(gender: gender)
        }
    }
    
    private func loadState() {
        BaseAPI.requestGet(path: "/account/mp/account/info", parameters: [:]) { (result: Result<TspResponse<AccountInfo>, Error>) in
            switch result {
            case .success(let response):
                print(response)
                self.viewState.nickname = response.data?.nickname ?? ""
                self.viewState.avatar = response.data?.avatar ?? ""
            case let .failure(error):
                print(error)
            }
        }
    }
    
    private func modifyNickname(nickname: String) {
        BaseAPI.requestPost(path: "/account/mp/account/action/modifyNickname", parameters: ["nickname": nickname]) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                print(response)
                if(response.code == 0) {
                    self.nickname = nickname
                    self.viewState.isItemView = false
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    private func modifyGender(gender: String) {
        BaseAPI.requestPost(path: "/account/mp/account/action/modifyGender", parameters: ["gender": gender]) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                print(response)
                if(response.code == 0) {
                    self.viewState.isItemView = false
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
