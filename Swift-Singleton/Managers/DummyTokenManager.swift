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
    class func getNewToken() -> Token {
        AppLogger.logInfo(message: "Get new Access Token")
        let token = Token(accessToken: String.randomString(length: 16), timestamp: Int64(Date().timeIntervalSince1970))
        sleep(5) // Sleep for 5s
        AppLogger.logInfo(message: "Latest Access Token: \(token)")
        
        saveLatestToken(token: token)
        
        return token
    }
    
    private class func saveLatestToken(token: Token) {
        PreferenceHelper.putString(key: tokenKey, value: "\(token.accessToken).\(token.timestamp)")
    }
    
    private class func getLatestToken() -> Token? {
        let tokenStr = PreferenceHelper.getString(key: tokenKey)
        if tokenStr.isEmpty {
            AppLogger.logError(message: "Token Information is nil")
            return nil
        }
        
        let tokenElement = tokenStr.split(separator: ".")
        if tokenElement.count < 2 {
            AppLogger.logError(message: "Token Information is wrong")
            return nil
        }
        
        let token = Token(accessToken: String(tokenElement[0]), timestamp: Int64(tokenElement[1]) ?? 0)
        
        return token
    }
    
    class func isLatestToken(token: Token) -> Bool {
        guard let lastestToken = getLatestToken() else {
            AppLogger.logInfo(message: "No Stored token found. Return false.")
            return false
        }
        
        return lastestToken == token
    }
}
