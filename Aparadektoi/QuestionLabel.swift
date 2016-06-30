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
 //   var questionTextFont : UIFont
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Font for question label text.
        let labelFont = AppFonts()
        self.font = labelFont.questionFont
    }
    
}