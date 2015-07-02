//
//  QuizViewController.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/19.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import UIKit
import AVFoundation

enum QuizStatus:Int{
    case BeforeStarted
    
    case WaitingAnswer
    case WaitingCorrectAnswer
    case PreparingNextProblem
    
    case Finished
}

class QuizViewController: UIViewController, WordsRecognitionDelegate {
    var quiz:QuizModel!
    var status = QuizStatus.BeforeStarted
    
    @IBOutlet weak var meaning: UILabel!
    
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    
    @IBOutlet weak var correctStatusView: UIView!
    @IBOutlet weak var correctStatusImageView: UIImageView!
    @IBOutlet weak var answerView: UIView!
    
    var answers:[UILabel] = []
    var wordsRecognition:WordsRecognition!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        answers = [answer1, answer2, answer3, answer4]
        
        if quiz == nil {
            quiz = QuizModel()
            // It is for test.
            quiz.preSaveWords()
            quiz.loadQuiz(1)
        }
        
        initRecognition()
        
        putQuestion()
        self.status = .WaitingAnswer
    }
    
    func initRecognition(){
        let wordsArray = quiz.getWordsArray()
        wordsRecognition = WordsRecognition(wordsArray)
        wordsRecognition.delegate = self
    }
    
    func correct(){
        nextProblem()
        correctStatusView.hidden = false
        correctStatusImageView.image = UIImage(named: "correct.png")

    }
    
    func wrong(){
        status = .WaitingCorrectAnswer
        correctStatusView.hidden = false
        correctStatusImageView.image = UIImage(named: "wrong.png")
        
        // TODO: Call next problem when detected correct answer or giving up user input
        nextProblem()
    }
    
    func nextProblem(){
        status = .PreparingNextProblem
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("showNextProblem"), userInfo: nil, repeats: false)
    }
    
    func showNextProblem(){
        status = .WaitingAnswer
        
        correctStatusView.hidden = true
        
        if quiz.nextQuestion() == nil {
            println("Quiz Ended")
            status = .Finished
            finish()
        }
        else {
            self.putQuestion()
            self.wordsRecognition.next()
        }
    }
    
    func finish(){
        self.performSegueWithIdentifier("QuizToResult", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "QuizToResult" {
            let destination = segue.destinationViewController as! ResultViewController
            destination.quizResult = self.quiz
        }
    }
    
    func recognizedWord(word: String) {
        if !(status == .WaitingAnswer || status == .WaitingCorrectAnswer){
            return
        }
        if quiz.checkAnswer(word) {
            println("正解")
            if status == .WaitingCorrectAnswer {
                nextProblem()
            }
            else {
                correct()
            }
        }
        else{
            println("不正解")
            wrong()
        }
    }
    
    func putQuestion(){
        if let question = quiz.getNowQuestion() {
            meaning.text = question.answerMeaning
            for i in 0..<answers.count {
                answers[i].text = question.words[i].word
            }
        }
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesBegan(touches as Set<NSObject>, withEvent: event)
        for touch: AnyObject in touches {
            var t: UITouch = touch as! UITouch
            if t.view.tag == self.answerView.tag {
                println("Taped (Say the word aloud!!)")
                let utterance = AVSpeechUtterance(string: "Tapped!")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                let talker = AVSpeechSynthesizer()
                talker.speakUtterance(utterance)
                // Error occured. Why!?
            }
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

