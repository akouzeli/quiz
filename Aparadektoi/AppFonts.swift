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
    let answerFont : UIFont
    let questionFont : UIFont
    
    override init() {
        questionFont = UIFont (name: "HelveticaNeue-Medium", size: 14)!
        answerFont = UIFont (name: "HelveticaNeue", size: 12)!
    }
    
}
