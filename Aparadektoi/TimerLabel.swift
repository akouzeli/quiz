//
//  TimerLabel.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 14/07/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import UIKit
import Foundation

class TimerLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Font for question label text.
        let appFonts = AppFonts.sharedInstance
        self.font = appFonts.questionFont
        
        // Same color as answer button background color.
        self.textColor = UIColor(red: 86/255, green: 197/255, blue: 239/255, alpha: 1)
        self.text = String(0)
        
    }
    
}