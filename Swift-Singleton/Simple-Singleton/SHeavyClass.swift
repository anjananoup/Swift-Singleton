//
//  SHeavyClass.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation
import AppLogger

class SHeavyClass: TokenEvent {
    private let tokenManager: STokenManager
    
    init() {
//        tokenManager = STokenManager()
        tokenManager = STokenManager.instance
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
