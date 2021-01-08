//
//  Event.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation

protocol TokenEvent {
    func doRefreshEvent()
    func isValidToken() -> Bool
}
