//
//  MTSHeavyClass.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/15/21.
//

import Foundation
import AppLogger

class MTSHeavyClass: TokenEvent {
    private var tokenManager: MTSTokenManager
    
    init() {
        tokenManager = MTSTokenManager.getInstance()
        printToken()
    }
    
    /// Event task
    func doRefreshEvent(onComplete: @escaping () -> Void) {
        for i in 0..<10 {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                AppLogger.logInfo(message: "Updating Token sequence: \(i)")
                self?.updateToken()
                onComplete()
                AppLogger.logInfo(message: "Update Token End sequence: \(i)")
            }
        }
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
