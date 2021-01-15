//
//  SAClass.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/15/21.
//

import Foundation
import AppLogger

class SAClass: SATokenManagerInjector, TokenEvent {
    init() {
        printToken()
    }
    
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
