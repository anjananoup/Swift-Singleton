//
//  Token.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation

class Token: Comparable {
    
    private(set) var accessToken: String
    private(set) var timestamp: Int64
    
    init(accessToken: String, timestamp: Int64) {
        self.accessToken = accessToken
        self.timestamp = timestamp
    }
    
    static func < (lhs: Token, rhs: Token) -> Bool {
        return lhs.timestamp < rhs.timestamp
    }
    
    static func == (lhs: Token, rhs: Token) -> Bool {
        return lhs.accessToken.elementsEqual(rhs.accessToken) && lhs.timestamp == rhs.timestamp
    }
}

extension Token: CustomStringConvertible {
    var description: String {
        "Token: \(accessToken), Update Timestamp: \(timestamp), Object Reference: \(ObjectIdentifier(self))"
    }
}
