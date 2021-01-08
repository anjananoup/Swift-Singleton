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
    
    func updateToken() {
        self.token = DummyTokenManager.getNewToken()
    }
    
    func isLatestToken() -> Bool {
        DummyTokenManager.isLatestToken(token: self.token)
    }
}
