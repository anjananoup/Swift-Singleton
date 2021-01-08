//
//  SClassB.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation

class SClassB: TokenEvent {
    private let tokenManager: STokenManager
    
    init() {
        tokenManager = STokenManager.instance
    }
    
    /// Event task
    func doRefreshEvent() {
        updateToken()
    }
    
    func isValidToken() -> Bool {
        tokenManager.isLatestToken()
    }
    
    private func updateToken() {
        tokenManager.updateToken()
    }
}
