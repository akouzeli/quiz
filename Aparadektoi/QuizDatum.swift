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
    
    
    // Returns question and relevant answers at random index.
    func fetchQuizDataAtRandomIndex() -> JSON {
        let jsonData = self.fetchJsonData()
        let randomIndex = Int(arc4random_uniform(UInt32(jsonData.count)))
        return jsonData[randomIndex]
    }
    
    // Returns the question
    func fetchQuestion(randomQuizData: JSON) -> String {
        let question = randomQuizData["question"].stringValue
        return question
    }
    
    // Returns an array with the available answers
    func fetchAnswers(randomQuizData: JSON) -> (answersArray: [JSON], answersEvaluationArray: [JSON]) {
        let answers = randomQuizData["answers"]
        var answersArray = [JSON]()
        var answersEvaluationArray = [JSON]()
        
        for i in 0..<answers.count {
            answersArray.append(answers[i]["text"])
            answersEvaluationArray.append(answers[i]["correct"])
        }
        return (answersArray, answersEvaluationArray)
    }
    
    //
    
//    // Returns the question and the correct answer.
//    func fetchQuestionAndCorrectAnswerAtIndex(index: Int) -> (question: String, correctAnswer: String) {
//        let setAtIndex = self.fetchSetAtIndex(index)
//        let question = setAtIndex["question"].stringValue
//        let correctAnswer = setAtIndex["correct_answer"].stringValue
//        return (question, correctAnswer)
//    }
    
    // Returns an array with the available answers
//    func fetchAnswersAtIndex(index: Int) -> Array<String> {
//        let availableAnswers = 4
//        let setAtIndex = self.fetchSetAtIndex(index)
//        var answersArray = [String]()
//        for i in 0..<availableAnswers {
//            answersArray.append(setAtIndex["answer_\(i)"].stringValue)
//        }
//        return answersArray
//    }
//    
//    func randomItem(jsonData: JSON) -> Int {
//        let index = Int(arc4random_uniform(UInt32(jsonData.count)))
//        return index
//    }
    
  
    
        
    
   
    
    
    
    
    

}