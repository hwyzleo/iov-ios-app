//
//  MyIntent.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import SwiftUI

class MyIntent {
    
    // MARK: Model
    
    private weak var model: MyModelActionProtocol?
    
    init(model: MyModelActionProtocol) {
        self.model = model
    }
    
}

extension MyIntent: MyIntentProtocol {
    
    func viewOnAppear() {
        model?.update()
    }
    
}
