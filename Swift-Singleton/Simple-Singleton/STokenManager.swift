//
//  STokenManager.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation

class STokenManager {
    private(set) var token: Token
    static let instance = STokenManager()
    
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
