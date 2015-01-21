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
        if questions.count <= index {
            return nil
        }
        return questions[index]
    }
    
    func nextQuestion() -> QuestionModel?{
        index += 1
        return getNowQuestion()
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
        var quiz:[QuestionModel] = questions
        
        // Please implement this.
        // Load a words from CoreData and construct this questions array.
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Model")
        request.predicate = NSPredicate(format: "level = %d", level)
        /*
        
        if let results = context.executeFetchRequest(request, error: nil) {
            var checkRandomNumber = Dictionary<Int,String>()
            
            var n = Int(arc4random() % UInt32(results.count)) + 1
            checkRandomNumber[n] = "already exists"
            
            var word = results[n].valueForKey("word") as String
            var answer = results[n].valueForKey("answer") as String
            
            while quiz.count < 4{
                var m = Int(arc4random() % UInt32(results.count)) + 1
                if let tmp = checkRandomNumber[m] {
                    continue
                }
                
            }
            
            
        }else{
            println("データがとれてないよ")
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