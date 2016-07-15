//
//  AppFonts.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 24/06/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import UIKit
import Foundation

class AppFonts: UIFont {
    let answerFont: UIFont
    let questionFont: UIFont
    let nextQuestionFont: UIFont
    let timerFont: UIFont
    // Singleton object for fonts
    static let sharedInstance = AppFonts()

    
    private override init() {
        questionFont = UIFont(name: "HelveticaNeue-Medium", size: 14)!
        timerFont = UIFont(name: "HelveticaNeue-Bold", size: 14)!
        answerFont = UIFont(name: "HelveticaNeue", size: 12)!
        nextQuestionFont = UIFont(name: "HelveticaNeue-Medium", size: 12)!
    }
    
}
