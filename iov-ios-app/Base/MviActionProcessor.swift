//
//  MviActionProcessor.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/14.
//

class MviActionProcessor<A: MviModelActionProtocol, S: MviModelStateProtocol> {
    
    func executeAction(action: A, state: S){
        fatalError("方法未实现")
    }
    
}
