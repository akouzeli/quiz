//
//  GameOverViewController.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 05/08/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    var currentScore = String(Score.scoreSharedInstance.scoreCounter)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Compute total score
        let totalScore = Score.scoreSharedInstance.computeTotalScore(currentScore)
        
        // Write score to file
        Score.scoreSharedInstance.writeScore(totalScore)
        
        // Read score from file. Alternatively, we could use the totalScore instead.
        let newScore = Score.scoreSharedInstance.readScore()
        
        scoreLabel.text = "👏✌️👏✌️👏✌️\n" + "Συγκεντρώσατε: " + newScore + " πόντους!\n👏✌️👏✌️👏✌️"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
