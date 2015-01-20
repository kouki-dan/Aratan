//
//  QuizViewController.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/19.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, WordsRecognitionDelegate {
    var quiz:QuizModel!
    
    @IBOutlet weak var meaning: UILabel!
    
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    
    
    var answers:[UILabel] = []
    var wordsRecognition:WordsRecognition!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        answers = [answer1, answer2, answer3, answer4]
        
        if quiz == nil {
            quiz = QuizModel()
            // It is for test.
            quiz.loadQuiz(1)
        }
        
        initRecognition()
        
        putQuestion()
    }
    
    func initRecognition(){
        let wordsArray = quiz.getWordsArray()
        wordsRecognition = WordsRecognition(wordsArray)
        wordsRecognition.delegate = self
    }
    
    func recognizedWord(word: String) {
        //TODO
    }
    
    func putQuestion(){
        if let question = quiz.nextQuestion() {
            meaning.text = question.answerMeaning
            for i in 0..<answers.count {
                answers[i].text = question.words[i]
            }
        }
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

