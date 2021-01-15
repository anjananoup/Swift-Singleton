//
//  NSHeavyClass.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation
import AppLogger

class NSHeavyClass: TokenEvent {
    private let tokenManager: NSTokenManager
    
    init() {
        tokenManager = NSTokenManager()
    }
    
    /// Event task
    func doRefreshEvent(onComplete: @escaping () -> Void) {
        for i in 0..<10 {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                AppLogger.logInfo(message: "Updating Token sequence: \(i)")
                self?.tokenManager.updateToken(onComplete: onComplete)
                AppLogger.logInfo(message: "Update Token End sequence: \(i)")
            }
        }
    }
    
    func isValidToken() -> Bool {
        tokenManager.isLatestToken()
    }
    
    func printToken() {
        AppLogger.logInfo(message: tokenManager.token.description)
    }
}
