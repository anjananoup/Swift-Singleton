//
//  SATokenManagerInjector.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/15/21.
//

import Foundation

protocol SATokenManagerInjector {
    var tokenManager: SATokenManager { get }
}

fileprivate let sharedAppSATokenManager: SATokenManager = SATokenManager()

extension SATokenManagerInjector {
    var tokenManager: SATokenManager {
        return sharedAppSATokenManager
    }
}
