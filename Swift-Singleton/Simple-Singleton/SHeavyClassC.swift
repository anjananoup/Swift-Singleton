//
//  SHeavyClassC.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation
import AppLogger

class SHeavyClassC: TokenEvent {
    private let tokenManager: STokenManager
    
    init() {
        tokenManager = STokenManager()
//        tokenManager = STokenManager.instance
    }
    
    /// Event task
    func doRefreshEvent() {
        for i in 0..<10 {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                AppLogger.logInfo(message: "Updating Token sequence: \(i)")
                self?.updateToken()
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
}
