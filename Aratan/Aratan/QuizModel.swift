//
//  QuizModel.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/19.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import Foundation
import CoreData

class QuizModel{
    var questions:[QuestionModel]
    var index = 0
    
    init(){
        questions = []
    }
    init(_ questions:[QuestionModel]){
        self.questions = questions
    }
    
    func getNowQuestion() -> QuestionModel?{
        return questions[index]
    }
    
    func nextQuestion() -> QuestionModel?{
        return questions[++index]
    }
    
    func getWordsArray() -> [[String]] {
        var wordsArray:[[String]] = []
        for question in questions {
            var words = question.words
            words.append("PASS")
            wordsArray.append(words)
        }
        
        return wordsArray
    }
    
    func checkAnswer(word:String) -> Bool {
        if let question = getNowQuestion() {
            return question.checkAnswer(word)
        }
    
        return false
    }
    
    func loadQuiz(level:Int){
        // Please implement this.
        // Load a words from CoreData and construct this questions array.
/*
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Model")
        request.predicate = NSPredicate(format: "level = %d", level)
        
        if let results = context.executeFetchRequest(request, error: nil) {
            var checkRandomNumber = Dictionary<Int,String>()
            
            var firsrWordIndex = Int(arc4random() % UInt32(results.count)) + 1
            checkRandomNumber[firsrWordIndex] = "already exists"
            
            var word = results[firsrWordIndex].valueForKey("word") as String
            var answerMeaning = results[firsrWordIndex].valueForKey("answerMeaning") as String
            var answerIndex = Int(arc4random() % 4) + 1
            
            var words:[String] = []
            words[answerIndex] = word
            
            for var i = 0; i < 10; i++ {
                var wordCount = 0
                while wordCount < 3 {
                    var randomIndex = Int(arc4random() % UInt32(results.count)) + 1
                    if let tmp = checkRandomNumber[randomIndex] {
                        continue
                    }
                
                    checkRandomNumber[randomIndex] = "already exists"
                    words[wordCount] = results[randomIndex].valueForKey("word") as String
                    wordCount++
                }
                
                let question = QuestionModel()
                question.words = words
                question.answerIndex = answerIndex
                question.answerMeaning = answerMeaning
                self.questions.append(question)
            }
        }
*/
        
        // The below is code for testing
        // TODO: Write!!

        let wordsArray = [
            ["WORD", "ALOUD", "SPEAK", "TANGO"],
            ["TEST", "PLAY", "FIX", "SUPER"],
            ["HAVE", "RICH", "GOOD", "PYTHON"],
            ["PRODUCT", "SCIENCE", "HEAD", "MAINTAIN"],
            ["TRAIN", "CREED", "STATUE", "LIBERTY"],
            ["REALIZE", "OBJECT", "ART", "ABSTRACT"],
            ["IMPULSE", "SOMETHING", "SALE", "LUXURIES"],
            ["ANTICIPATE", "EMPLOY", "CUT", "COMPETENT"],
            ["BIRTHRATE", "STEADILY", "INHABITANT", "MUCH"],
        ]
        for words in wordsArray {
            let question = QuestionModel()
            question.words = words
            question.answerMeaning = words[0]
            self.questions.append(question)
        }

        
        // Until here
    }
    
}