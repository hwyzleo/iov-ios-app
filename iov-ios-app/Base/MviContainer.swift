//
//  MVIContainer.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import Foundation
import Combine

/// MVI容器
final class MviContainer<Intent, Model>: ObservableObject {
    
    public let intent: Intent
    public let model: Model
    
    private var cancellable: Set<AnyCancellable> = []
    
    init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model
        
        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
    
}
