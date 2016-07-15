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
    
    var counter = 0
    var timer = NSTimer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizData = myQuizDatum.fetchQuizDataAtRandomIndex()
        let question = myQuizDatum.fetchQuestion(quizData)
        let answers = myQuizDatum.fetchAnswers(quizData).answersArray
        
        
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
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(countUp), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Increase timer counter
    func countUp() {
        counter += 1
        countingLabel.text = String(counter)
    }
    
    // Inactivate answers that were not selected
    func inactivateOtherAnswers(exceptFromIndex: Int, numOfAnswers: Int) {
        for i in 0..<numOfAnswers {
            if i != exceptFromIndex {
                answerButtons[i].enabled = false
            }
        }
    }
  
    // Mark selected answers
    @IBAction func markAnswer(sender: AnswerButton) {
        answersEvaluation = myQuizDatum.fetchAnswers(quizData).answersEvaluationArray
        // Mark wrong answer
        if !answersEvaluation[sender.index] {
            sender.backgroundColor = sender.wrongAnswerBackgroundColor
        } else {
            // Mark correct answer
            sender.backgroundColor = sender.correctAnswerBackgroundColor
        }
        inactivateOtherAnswers(sender.index, numOfAnswers: answersEvaluation.count)
        
        // Pause timer
        timer.invalidate()

    }
}