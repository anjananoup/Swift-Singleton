//
//  AppLogger.swift
//
//  Created by Anjan Kumar Majumder on 1/07/21.
//  Copyright © 2021 Anjan. All rights reserved.
//

import Foundation

public class AppLogger {
    private init() {}
    
    public class func logInfo(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        print("\(Date().utcInLocalTime): \(NSURL.fileURL(withPath: file).lastPathComponent):\(function):\(line) - \(message)")
    }

    public class func logError(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        print("\(Date().utcInLocalTime): [Error]: \(NSURL.fileURL(withPath: file).lastPathComponent):\(function):\(line) - \(message)")
    }
}
