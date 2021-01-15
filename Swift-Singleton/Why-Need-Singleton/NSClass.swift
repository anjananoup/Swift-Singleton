//
//  NSClass.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation
import AppLogger

class NSClass: TokenEvent {
    private let tokenManager: NSTokenManager
    
    init() {
        tokenManager = NSTokenManager()
    }
    
    /// Event task
    func doRefreshEvent(onComplete: @escaping () -> Void) {
        tokenManager.updateToken(onComplete: onComplete)
    }
    
    func isValidToken() -> Bool {
        tokenManager.isLatestToken()
    }
    
    func printToken() {
        AppLogger.logInfo(message: tokenManager.token.description)
    }
}
