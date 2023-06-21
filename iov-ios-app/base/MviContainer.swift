//
//  MVIContainer.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/6/21.
//

import Foundation
import Combine

final class MviContainer<Intent, Model>: ObservableObject {
    
    // MARK: Public
    
    let intent: Intent
    let model: Model
    
    // MARK: Private
    
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: Lift cycle
    
    init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model
        
        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
    
}
