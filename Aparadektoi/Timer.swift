//
//  Timer.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 18/07/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import Foundation

class Timer {
    var counter: Int
    static let timerSharedInstance = Timer()
    
    init() {
        counter = 0
    }
    
    func decreaseTimerCounter() -> Int {
        counter += 1
        return counter
    }
    
}