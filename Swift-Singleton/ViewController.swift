//
//  ViewController.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import UIKit
import AppLogger

class ViewController: UIViewController, UILogger {

    private var example: Example?
    
    @IBOutlet weak var logTxt: UITextView!
    @IBAction func doSomethingBtn(_ sender: Any) {
        self.clearLog()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.example?.runExample()
        }
    }
    
    private var mLogString = ""
    private var defaultLogTxt = "Press The button for Testing"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppLogger.logInfo(message: "App Started")
        
        example = NSExample()
//        example = SExample()
//        example = MTPExample()
//        example = MTSExample()
//        example = SAExample()
        
        
        // Add UI Logger
        example?.addUILogger(logger: self)
        
        clearLog()
    }


    private func setLogs(_ log: String) {
        DispatchQueue.main.async { [weak self] in
            if !log.isEmpty {
                self?.mLogString.append("\n")
                self?.mLogString.append(log)
            }
            
            AppLogger.logInfo(message: log)
            self?.logTxt.text = self?.mLogString
            //Scroll to bottom
            self?.scrollToBottom()
        }
    }
    
    private func clearLog() {
        mLogString = ""
        logTxt.text = defaultLogTxt
    }
    
    private func scrollToBottom() {
        let bottom = NSRange(location: mLogString.count - 1, length: 1)
        logTxt.scrollRangeToVisible(bottom)
    }
    
    func printLog(log: String) {
        setLogs(log)
    }
}

