//
//  DummyTokenManager.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation
import AppLogger

class DummyTokenManager {
    private init() { }
    
    private static let tokenKey = "Token_Key"
    
    static var defaultToken: Token = {
        let token = Token(accessToken: String.randomString(length: 16), timestamp: Int64(Date().timeIntervalSince1970))
        AppLogger.logInfo(message: "Default Access Token: \(token)")
        saveLatestToken(token: token)
        return token
    }()
    
    /// Dummy Token Creator
    class func getNewToken(onUpdate: @escaping (Token) -> Void) {
        AppLogger.logInfo(message: "Get new Access Token")
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(5)) { // Dummy Async Operation for 5s
            let token = Token(accessToken: String.randomString(length: 16), timestamp: Int64(Date().timeIntervalSince1970))
            saveLatestToken(token: token)
            AppLogger.logInfo(message: "Latest Access Token: \(token)")
            onUpdate(token)
        }
    }
    
    private class func saveLatestToken(token: Token) {
        PreferenceHelper.putString(key: tokenKey, value: "\(token.accessToken).\(token.timestamp)")
    }
    
    class func getLatestToken() -> Token {
        let tokenStr = PreferenceHelper.getString(key: tokenKey)
        if tokenStr.isEmpty {
            AppLogger.logError(message: "Token Information is nil")
            return Token(accessToken: "Nil", timestamp: -1)
        }
        
        let tokenElement = tokenStr.split(separator: ".")
        if tokenElement.count < 2 {
            AppLogger.logError(message: "Token Information is wrong")
            return Token(accessToken: "Nil", timestamp: -1)
        }
        
        let token = Token(accessToken: String(tokenElement[0]), timestamp: Int64(tokenElement[1]) ?? 0)
        
        return token
    }
    
    class func isLatestToken(token: Token) -> Bool {
        return getLatestToken() == token
    }
}
