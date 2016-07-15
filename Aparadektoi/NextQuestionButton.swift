//
//  NextQuestionButton.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 12/07/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import UIKit
import Foundation

class NextQuestionButton: UIButton {
    @IBInspectable let background: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    @IBInspectable let textColor: UIColor = UIColor.whiteColor()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Customizing the background color and the text color for the answer buttons
        self.backgroundColor = background
        self.tintColor = textColor
        
        // Font for the answer button text.
        //let buttonTextFont = AppFonts()
        let appFonts = AppFonts.sharedInstance
        self.titleLabel?.font = appFonts.nextQuestionFont
        self.setTitle("Επόμενη Ερώτηση", forState: .Normal)
    }
    
}
