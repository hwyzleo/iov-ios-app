//
//  MyModel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

final class MyModel: ObservableObject, MyModelStateProtocol {
    
    @Published var contentState: MyTypes.Model.ContentState = .content
    
}

// MARK: - Action Protocol

extension MyModel: MyModelActionProtocol {
    
    func update() {
        contentState = .content
    }
    
}

extension MyTypes.Model {
    enum ContentState {
        case content
        case error(text: String)
    }
}
