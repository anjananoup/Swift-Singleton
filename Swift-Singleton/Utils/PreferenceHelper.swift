//
//  PreferenceHelper.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation

class PreferenceHelper {
    private init() { }

    private static let preferences = UserDefaults.standard

    class func getString(key: String, defaultValue: String = "") -> String {
        return preferences.string(forKey: key) ?? defaultValue
    }

    class func putString(key: String, value: Any?) {
        preferences.set(value, forKey: key)
    }
}
