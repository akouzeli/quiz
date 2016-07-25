//
//  DataManager.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 20/07/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataManager {
    
    let filePath: String
    let jsonData: NSData
    var json: JSON
    
    static let dataSharedInstance = DataManager()
    
    private init() {
        // The path for the JSON file
        filePath = NSBundle.mainBundle().pathForResource("quizData", ofType: "json")!
        // Convert JSON into a NSData object.
        jsonData = NSData(contentsOfFile: filePath)!
        json = JSON(data: jsonData)
    }
    
    /** 
     * Returns a tuple that contains
     * a random set of question and relevant answers.
     */
    func fetchQuizDataSetAtRandomIndex() -> (question: String, answers: [JSON], answersEvaluation: [JSON]) {
        var question = ""
        var answers = [JSON]()
        var answersEvaluation = [JSON]()
        
        if json.arrayObject?.count != 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(json.count)))
            
            // Question string.
            question = json[randomIndex]["question"].stringValue
            
            let answersArray = json[randomIndex]["answers"].arrayValue
            // The answers array and their evaluation array.
            answers = [JSON]()
            answersEvaluation = [JSON]()
            
            for i in 0..<answersArray.count {
                answers.append(answersArray[i]["text"])
                answersEvaluation.append(answersArray[i]["correct"])
            }
            
            // Remove specific data set from data array.
            json.arrayObject?.removeAtIndex(randomIndex)
                        
        } else {
            question = "Δυστυχώς, δεν υπάρχει άλλη ερώτηση..."
            answers = ["Μπλα", "Μπλα", "Μπλα", "Μπλα"]
            answersEvaluation = [false, false, false, false]
        }
        
        return (question, answers, answersEvaluation)


    }
    
    
    
}