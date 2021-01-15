//
//  SExample.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation
import AppLogger

class SExample: Example {
    private var objA: TokenEvent
    private var objB: TokenEvent
    private var heavyObjC: TokenEvent
    private weak var uiLogger: UILogger?
    
    init() {
        self.objA = SClass()
        self.objB = SClass()
        self.heavyObjC = SHeavyClass()
    }
    
    func runExample() {
        checkLatest()
        
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(5)) { [weak self] in
            self?.objA.doRefreshEvent(onComplete: { [weak self] in
                self?.checkLatest()
            })
        }

        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(6)) { [weak self] in
            self?.objB.doRefreshEvent(onComplete: { [weak self] in
                self?.checkLatest()
            })
        }

        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(7)) { [weak self] in
            self?.heavyObjC.doRefreshEvent(onComplete: { [weak self] in
                self?.checkLatest()
            })
        }
    }
    
    private func checkLatest() {
        uiLogger?.printLog(log: "ObjA isContain latest info: \(objA.isValidToken())")
        uiLogger?.printLog(log: "ObjB isContain latest info: \(objB.isValidToken())")
        uiLogger?.printLog(log: "HeavyObjC isContain latest info: \(heavyObjC.isValidToken())")
        
        objA.printToken()
        objB.printToken()
        heavyObjC.printToken()
    }
    
    func addUILogger(logger: UILogger) {
        uiLogger = logger
    }
}
