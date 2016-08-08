//
//  ScoreLabel.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 05/08/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import UIKit
import Foundation

class ScoreLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Font for question label text.
        let appFonts = AppFonts.sharedInstance
        self.font = appFonts.scoreFont
    }
    
}