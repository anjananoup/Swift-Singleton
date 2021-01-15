//
//  SAExample.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/15/21.
//

import Foundation

class SAExample: Example {
    private var objA: TokenEvent?
    private var objB: TokenEvent?
    private var heavyObjC: TokenEvent?
    private weak var uiLogger: UILogger?
    
    private let serialQueue = DispatchQueue(label: "MySerailQueue", qos: .userInitiated, target: DispatchQueue.global())
    
    private func doASyncTask(task: @escaping () -> Void) {
        Thread {
            task()
        }.start()
    }
    
    init() {
        doASyncTask { [weak self] in
            self?.objA = SAClass()
        }
        doASyncTask { [weak self] in
            self?.objB = SAClass()
        }
        doASyncTask { [weak self] in
            self?.heavyObjC = SAHeavyClass()
        }
    }
    
    func runExample() {
        uiLogger?.printLog(log: "Wait for object initialization")
        serialQueue.asyncAfter(deadline: .now() + .seconds(6)) { [weak self] in
            self?.checkLatest()
            
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(5)) { [weak self] in
                self?.objA?.doRefreshEvent(onComplete: { [weak self] in
                    self?.checkLatest()
                })
            }

            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(6)) { [weak self] in
                self?.objB?.doRefreshEvent(onComplete: { [weak self] in
                    self?.checkLatest()
                })
            }

            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(7)) { [weak self] in
                self?.heavyObjC?.doRefreshEvent(onComplete: { [weak self] in
                    self?.checkLatest()
                })
            }
        }
    }
    
    private func checkLatest() {
        self.uiLogger?.printLog(log: "ObjA isContain latest info: \(objA?.isValidToken() ?? false)")
        self.uiLogger?.printLog(log: "ObjB isContain latest info: \(objB?.isValidToken() ?? false)")
        self.uiLogger?.printLog(log: "HeavyObjC isContain latest info: \(heavyObjC?.isValidToken() ?? false)")
        
        self.objA?.printToken()
        self.objB?.printToken()
        self.heavyObjC?.printToken()
    }
    
    func addUILogger(logger: UILogger) {
        uiLogger = logger
    }
}
