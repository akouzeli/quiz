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
    
    // Buttons for question and available answers.
    @IBOutlet weak var questionLabel: QuestionLabel!
    @IBOutlet var answerButtons: [AnswerButton]!
    
    // Timer's label.
    @IBOutlet weak var countingLabel: TimerLabel!
    
    // The property variable that holds a random data set, consisted of a question, 
    // its relevant answers and their evaluation.
    var quizDataSet: (question: String, answers: [JSON], answersEvaluation:[JSON])
    
    // Variables related to the timer's counter.
    var timer = NSTimer()
    var quizTimer = Timer.timerSharedInstance
    
    required init?(coder aDecoder: NSCoder) {
        let myQuizData = DataManager.dataSharedInstance
        // Initialize the quiz data set.
        quizDataSet = myQuizData.fetchQuizDataSetAtRandomIndex()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Define the transition style to use when presenting the view controller.
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        // Question and answers
        let question = quizDataSet.question
        let answers = quizDataSet.answers
        
        // Display the question
        questionLabel.text = question
        
        // Display the answers
        for i in 0..<answerButtons.count {
            answerButtons[i].setTitle(answers[i].stringValue, forState: .Normal)
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(displayTimer), userInfo: nil, repeats: true)
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Method used for displaying the timer's counter.
    func displayTimer() {
        let timerValue = quizTimer.decreaseTimerCounter()
        countingLabel.text = String(timerValue)
    }
    
    // Inactivate answers that were not selected
    func inactivateOtherAnswers(exceptFrom index: Int, numOfAnswers number: Int) {
        for i in 0..<number {
            if i != index {
                answerButtons[i].enabled = false
            }
        }
    }
  
    // Mark selected answers
    @IBAction func markAnswer(sender: AnswerButton) {
        // Array that holds the answers evaluation.
        var answersEvaluation = quizDataSet.answersEvaluation
        // Mark wrong answer.
        if !answersEvaluation[sender.index] {
            sender.backgroundColor = sender.wrongAnswerBackgroundColor
        } else {
            // Mark correct answer.
            sender.backgroundColor = sender.correctAnswerBackgroundColor
        }
        // Inactivate wrong answers.
        inactivateOtherAnswers(exceptFrom: sender.index, numOfAnswers: answersEvaluation.count)
        
        // Pause the timer when an answer is selected.
        timer.invalidate()
        
        // Stay on the current question for a while and then
        // move to a new one.
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("quizViewController") as! QuizViewController
      
        let seconds = 1.0
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            self.presentViewController(vc, animated: true, completion: nil)
         })
    }
    
}