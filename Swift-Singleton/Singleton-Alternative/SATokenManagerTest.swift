//
//  SATokenManagerTest.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/15/21.
//

import Foundation
import AppLogger

class SATokenManagerTest {
    private(set) var token: Token
    private let concurrentSync = DispatchQueue(label: "ConcurrentQueue", qos: .userInitiated, attributes: .concurrent, target: DispatchQueue.global())
    
    init() {
        AppLogger.logInfo(message: "I am Dummy Manager")
        token = DummyTokenManager.defaultToken
        sleep(5) //Some Heavy task
        AppLogger.logInfo(message: "Object Creation done. Token: \(token)")
    }
    
    func updateToken(onComplete: @escaping () -> Void) {
        self.concurrentSync.async(flags: .barrier) { [weak self] in
            self?.token = Token(accessToken: "I am a test Token", timestamp: 1234)
            onComplete()
        }
    }
    
    func isLatestToken() -> Bool {
        concurrentSync.sync {
            true // I am always true
        }
    }
}
