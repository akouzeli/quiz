//
//  QuizViewController.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 25/06/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

class QuizViewController: UIViewController {
    
    // Buttons for question and available answers
//    @IBOutlet weak var answerOneButton: AnswerButton!
//    @IBOutlet weak var answerTwoButton: AnswerButton!
    
//    @IBOutlet weak var answerThreeButton: AnswerButton!
//    @IBOutlet weak var answerFourButton: AnswerButton!
    @IBOutlet weak var questionLabel: QuestionLabel!

    @IBOutlet weak var countingLabel: TimerLabel!
    @IBOutlet var answerButtons: [AnswerButton]!
    
    let myQuizDatum = QuizDatum()
    var quizData: JSON = []
    var answersEvaluation = [JSON]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.quizData = self.myQuizDatum.fetchQuizDataAtRandomIndex()
        
        let question = self.myQuizDatum.fetchQuestion(quizData)
        let answers = self.myQuizDatum.fetchAnswers(quizData).answersArray
        
        
        // Display the question
        questionLabel.text = question
        
        // Display the answers
        for i in 0..<answerButtons.count {
            answerButtons[i].setTitle(answers[i].stringValue, forState: .Normal)
        }
        
        
//        let seconds = 2.0
//        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
//        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
//        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
//            self.performSegueWithIdentifier("quizViewController", sender: self)
//        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Inactivate answers that were not selected
    func inactivateOtherAnswers(exceptIndex: Int, numOfAnswers: Int) {
        for i in 0..<numOfAnswers {
            if i != exceptIndex {
                answerButtons[i].enabled = false
            }
        }
    }
  
    // Mark selected answers
    @IBAction func markAnswer(sender: AnswerButton) {
        self.answersEvaluation = self.myQuizDatum.fetchAnswers(self.quizData).answersEvaluationArray
        // Mark wrong answer
        if !self.answersEvaluation[sender.index] {
            sender.backgroundColor = sender.wrongAnswerBackgroundColor
        } else {
            // Mark correct answer
            sender.backgroundColor = sender.correctAnswerBackgroundColor
        }
        self.inactivateOtherAnswers(sender.index, numOfAnswers: self.answersEvaluation.count)
    }
    
    
}