//
//  AnswerButton.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 24/06/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import UIKit
import Foundation


class AnswerButton: UIButton {
    @IBInspectable let background: UIColor = UIColor(red: 110/255, green: 194/255, blue: 1, alpha: 1)
    @IBInspectable let answerColor: UIColor = UIColor.blackColor()
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Customizing the background color and the text color for the answer buttons 
        self.backgroundColor = background
        self.tintColor = answerColor
        
        // Font for the answer button text.
        let buttonTextFont = AppFonts()
        self.titleLabel?.font = buttonTextFont.answerFont

    }
    
}
