//
//  QuizViewController.swift
//  Aparadektoi
//
//  Created by Alexandra Kouzeli on 25/06/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

import UIKit
import Foundation

class QuizViewController: UIViewController {
    
    // Buttons for question and available answers
    @IBOutlet weak var questionLabel: QuestionLabel!
//    @IBOutlet weak var answerOneButton: AnswerButton!
//    @IBOutlet weak var answerTwoButton: AnswerButton!
//    @IBOutlet weak var answerThreeButton: AnswerButton!
//    @IBOutlet weak var answerFourButton: AnswerButton!
    @IBOutlet var answerButtons: [AnswerButton]!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myQuizDatum = QuizDatum()
        
        let randomItem = myQuizDatum.randomItem(myQuizDatum.fetchJsonData())
        
        let questionAndCorrectAnswer = myQuizDatum.fetchQuestionAndCorrectAnswerAtIndex(randomItem)
        // Display the question
        self.questionLabel.text = questionAndCorrectAnswer.question
        
        // Create the array that holds the available answers
        // and display them.
        let answers = myQuizDatum.fetchAnswersAtIndex(randomItem)
        for i in 0..<answerButtons.count {
            self.answerButtons[i].setTitle(answers[i], forState: .Normal)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}