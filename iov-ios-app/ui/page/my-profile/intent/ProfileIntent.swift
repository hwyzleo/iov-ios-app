//
//  ProfileIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class ProfileIntent: MviIntent {
    
    // MARK: Model
    
    private weak var model: ProfileModelActionProtocol?
    @AppStorage("userNickname") private var userNickname: String = ""
    
    init(model: ProfileModelActionProtocol) {
        self.model = model
    }
    
}

// MARK: Public

extension ProfileIntent: ProfileIntentProtocol {
    func viewOnAppear() {
        model?.displayLoading()
        BaseAPI.requestGet(path: "/account/mp/account/info", parameters: [:]) { (result: Result<TspResponse<AccountInfo>, Error>) in
            switch result {
            case .success(let response):
                self.model?.update(account: response.data!)
            case let .failure(error):
                print(error)
                self.model?.displayError(text: "请求异常")
            }
        }
    }
    func enterNickname() {
        model?.enterNickname()
    }
    func modifyNickname(nickname: String) {
        model?.displayLoading()
        BaseAPI.requestPost(path: "/account/mp/account/action/modifyNickname", parameters: ["nickname": nickname]) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    self.userNickname = nickname
                    self.model?.updateNickname(nickname: nickname)
                } else {
                    self.model?.displayError(text: response.message ?? "异常")
                }
            case let .failure(error):
                print(error)
                self.model?.displayError(text: "请求异常")
            }
        }
    }
    func enterGender() {
        model?.enterGender()
    }
    func modifyGender(gender: String) {
        model?.displayLoading()
        BaseAPI.requestPost(path: "/account/mp/account/action/modifyGender", parameters: ["gender": gender]) { (result: Result<TspResponse<NoReply>, Error>) in
            switch result {
            case .success(let response):
                if(response.code == 0) {
                    self.model?.updateGender(gender: gender)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}

// MARK: - Helper classes

extension ProfileTypes.Intent {
    struct ExternalData {}
}
