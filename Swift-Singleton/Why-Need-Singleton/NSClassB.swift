//
//  NSClassB.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation

class NSClassB: TokenEvent {
    private let tokenManager: NSTokenManager
    
    init() {
        tokenManager = NSTokenManager()
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
