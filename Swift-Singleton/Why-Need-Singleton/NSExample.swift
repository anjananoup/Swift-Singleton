//
//  NSExample.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation
import AppLogger

class NSExample: Example {
    private var objA: TokenEvent
    private var objB: TokenEvent
    private var heavyObjC: TokenEvent
    private weak var uiLogger: UILogger?
    
    init() {
        self.objA = NSClassA()
        self.objB = NSClassB()
        self.heavyObjC = NSHeavyClassC()
    }
    
    func runExample() {
        checkLatest()
        
//        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(5)) { [weak self] in
//            self?.objA.doRefreshEvent()
//            self?.checkLatest()
//        }

        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(5)) { [weak self] in
            self?.objB.doRefreshEvent()
            self?.checkLatest()
        }

//        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(5)) { [weak self] in
//            self?.heavyObjC.doRefreshEvent()
//            self?.checkLatest()
//        }
    }
    
    private func checkLatest() {
        uiLogger?.printLog(log: "ObjA isContain latest info: \(objA.isValidToken())")
        uiLogger?.printLog(log: "ObjB isContain latest info: \(objB.isValidToken())")
        uiLogger?.printLog(log: "HeavyObjC isContain latest info: \(heavyObjC.isValidToken())")
    }
    
    func addUILogger(logger: UILogger) {
        uiLogger = logger
    }
}
