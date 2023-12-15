//
//  BaseViewModel.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/13.
//

import Foundation

class BaseViewModel<I: MviIntentProtocol, A: MviModelActionProtocol, S: MviModelStateProtocol>: ObservableObject {
    
    // 状态
    @Published var viewState: S
    
    init (viewState: S) {
        self.viewState = viewState
    }
    
    func dispatch(intent: I){
        fatalError("方法未实现")
    }
    
    func actionFromIntent(intent: I) -> A {
        fatalError("方法未实现")
    }
    
    func executeAction(action: A) {
        fatalError("方法未实现")
    }

}
