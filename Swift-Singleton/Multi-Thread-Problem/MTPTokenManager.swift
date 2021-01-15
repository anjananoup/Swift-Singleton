//
//  MTPTokenManager.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/15/21.
//

import Foundation
import AppLogger

private var globalCounter = 0

class MTPTokenManager {
    private(set) var token: Token
    private static var sToken: MTPTokenManager?
    
    private init() {
        globalCounter += 1
        AppLogger.logInfo(message: "Starting init. Counter: \(globalCounter)")
        token = DummyTokenManager.defaultToken
        sleep(5) //Some Heavy task
        AppLogger.logInfo(message: "Object Creation done. Counter: \(globalCounter), Token: \(token)")
    }
    
    class func getInstance() -> MTPTokenManager {
        if sToken == nil {
            AppLogger.logError(message: "MTP Token Manager is nil. Recreating")
            sToken = MTPTokenManager()
        }
        return sToken!
    }
    
    func updateToken(onComplete: @escaping () -> Void) {
        DummyTokenManager.getNewToken { [weak self] token in
            self?.token = token
            onComplete()
        }
    }
    
    func isLatestToken() -> Bool {
        DummyTokenManager.isLatestToken(token: self.token)
    }
}
