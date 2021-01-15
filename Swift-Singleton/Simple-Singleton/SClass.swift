//
//  SClass.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation
import AppLogger

class SClass: TokenEvent {
    private let tokenManager: STokenManager
    
    init() {
        tokenManager = STokenManager.instance
    }
    
    /// Event task
    func doRefreshEvent(onComplete: @escaping () -> Void) {
        tokenManager.updateToken(onComplete: onComplete)
    }
    
    func isValidToken() -> Bool {
        tokenManager.isLatestToken()
    }
    
    private func updateToken() {
        
    }
    
    func printToken() {
        AppLogger.logInfo(message: tokenManager.token.description)
    }
}
