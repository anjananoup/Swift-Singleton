//
//  STokenManager.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation

//static let instance = STokenManager()

class STokenManager {
    private(set) var token: Token
    static let instance = STokenManager()
    
    init() {
        self.token = DummyTokenManager.defaultToken
    }
    
//    private init() {
//        self.token = DummyTokenManager.defaultToken
//    }
    
    func updateToken(onComplete: @escaping () -> Void) {
        DummyTokenManager.getNewToken(onUpdate: { [weak self] token in
            self?.token = token
            onComplete()
        })
    }
    
    func isLatestToken() -> Bool {
        DummyTokenManager.isLatestToken(token: self.token)
    }
}
