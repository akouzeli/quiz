//
//  Score.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 07/08/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import Foundation

class Score {
    var scoreCounter: Int
    static let scoreSharedInstance = Score()
    let file = "score.txt" //this is the file. we will write to and read from it
    
    init() {
        scoreCounter = 0
    }
    
    func increaseScore() -> Int {
        scoreCounter += 1
        return scoreCounter
    }
    
    // Writes current score to a file.
    func writeScore(score: String) {
        
        if let dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file)
            
            do {
                try String(score).writeToURL(path, atomically: false, encoding: NSUTF8StringEncoding)
            }
            catch let error as NSError {
                print("Failed writing to URL: \(path), Error: " + error.localizedDescription)
            }
        }
    }
    
    // Reads the stored score.
    func readScore() -> String {
        let dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first
        let path = NSURL(fileURLWithPath: dir!).URLByAppendingPathComponent(file)
        var readScore = ""
        
        do {
            readScore = try String(contentsOfURL: path)
        } catch let error as NSError {
            print("Failed reading from URL: \(file), Error: " + error.localizedDescription)
        }
        return readScore
    }
    
    func computeTotalScore(currentScore: String) -> String {
        // Get already stored score.
        var initialScore = readScore()
        
        if initialScore != "" {
            initialScore = readScore()
        } else {
            initialScore = "0"
        }
        
        let sum = Int(initialScore)! + Int(currentScore)!
        return String(sum)
    }

    
}