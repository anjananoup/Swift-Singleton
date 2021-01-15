//
//  MTPClass.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/15/21.
//

import Foundation
import AppLogger

class MTPClass: TokenEvent {
    private let tokenManager: MTPTokenManager
    
    init() {
        tokenManager = MTPTokenManager.getInstance()
        printToken()
    }
    
    /// Event task
    func doRefreshEvent(onComplete: @escaping () -> Void) {
        updateToken()
        onComplete()
    }
    
    func isValidToken() -> Bool {
        tokenManager.isLatestToken()
    }
    
    private func updateToken() {
        tokenManager.updateToken()
    }
    
    func printToken() {
        AppLogger.logInfo(message: tokenManager.token.description)
    }
}
