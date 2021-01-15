//
//  SATokenManager.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/15/21.
//

import Foundation
import AppLogger

private var globalCounter = 0

class SATokenManager {
    private(set) var token: Token
    private let concurrentSync = DispatchQueue(label: "ConcurrentQueue", qos: .userInitiated, attributes: .concurrent, target: DispatchQueue.global())
    
    init() {
        globalCounter += 1
        AppLogger.logInfo(message: "Starting init. Counter: \(globalCounter)")
        token = DummyTokenManager.defaultToken
        sleep(5) //Some Heavy task
        AppLogger.logInfo(message: "Object Creation done. Counter: \(globalCounter), Token: \(token)")
    }
    
    func updateToken() {
        DummyTokenManager.getNewToken(onUpdate: { [weak self] token in
            self?.concurrentSync.async(flags: .barrier) {
                self?.token = token
            }
        })
    }
    
    func isLatestToken() -> Bool {
        concurrentSync.sync {
            token == DummyTokenManager.getLatestToken()
        }
    }
}
