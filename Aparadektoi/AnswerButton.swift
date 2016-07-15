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
    @IBInspectable var defaultBackgroundColor: UIColor = UIColor(red: 86/255, green: 197/255, blue: 239/255, alpha: 1)
    @IBInspectable let answerColor: UIColor = UIColor.blackColor()
    var index: Int = 0
    @IBInspectable let wrongAnswerBackgroundColor: UIColor = UIColor(red: 250/255, green: 110/255, blue: 110/255, alpha: 1)
    @IBInspectable let correctAnswerBackgroundColor: UIColor = UIColor(red: 195/255, green: 232/255, blue: 218/255, alpha: 1)
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Customizing the background color and the text color for the answer buttons 
        self.backgroundColor = defaultBackgroundColor
        self.tintColor = answerColor
        
        // Font for the answer button text.
        let appFonts = AppFonts.sharedInstance
        self.titleLabel?.font = appFonts.answerFont
        //let fonts = AppFonts()
        //let fonts = AppFonts.sharedInstance
       // self.titleLabel?.font = fonts.answerFont

    }
    
}
