//
//  QuestionLabel.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 24/06/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import UIKit
import Foundation

class QuestionLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Font for question label text.
        let appFonts = AppFonts.sharedInstance
        self.font = appFonts.questionFont
        
    }
    
}