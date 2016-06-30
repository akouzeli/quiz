//
//  QuizDatum.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 26/06/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import Foundation
import SwiftyJSON

class QuizDatum {
    
    let filePath: String
    let jsonData: NSData
    let json: JSON
    
    init() {
        filePath = NSBundle.mainBundle().pathForResource("quizData", ofType: "json")!
        jsonData = NSData(contentsOfFile: filePath)!
        json = JSON(data: jsonData)
    }
    
    func fetchJsonData() -> JSON {
        return self.json;
    }
    
    // Returns question and available answers at specific index
    func fetchSetAtIndex(index: Int) -> JSON {
        let quizSet = self.fetchJsonData()
        return quizSet[index]
    }
    
    // Returns the question and the correct answer.
    func fetchQuestionAndCorrectAnswerAtIndex(index: Int) -> (question: String, correctAnswer: String) {
        let setAtIndex = self.fetchSetAtIndex(index)
        let question = setAtIndex["question"].stringValue
        let correctAnswer = setAtIndex["correct_answer"].stringValue
        return (question, correctAnswer)
    }
    
    // Returns an array with the available answers
    func fetchAnswersAtIndex(index: Int) -> Array<String> {
        let availableAnswers = 4
        let setAtIndex = self.fetchSetAtIndex(index)
        var answersArray = [String]()
        for i in 0..<availableAnswers {
            answersArray.append(setAtIndex["answer_\(i)"].stringValue)
        }
        return answersArray
    }
    
    func randomItem(jsonData: JSON) -> Int {
        let index = Int(arc4random_uniform(UInt32(jsonData.count)))
        return index
    }
    
        
//    func fetchRandomQuestionAndCorrectAnswer(jsonData: JSON) -> (question: String, correctAnswer: String) {
//        let randomIndex = self.randomItem(jsonData)
//        let randomSet = self.fetchSetAtIndex(randomIndex)
//        let randomQuestion = randomSet["question"].stringValue
//        let randomCorrectAnswer = randomSet["correct_answer"].stringValue
//        return (randomQuestion, randomCorrectAnswer)
//        
//    }
    
  
    
        
    
   
    
    
    
    
    

}