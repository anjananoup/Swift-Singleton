//
//  NSTokenManager.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation

//Control access to some shared resource—for example, a database or a file.

class NSTokenManager {
    private(set) var token: Token
    
    init() {
        self.token = DummyTokenManager.defaultToken
    }
    
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
