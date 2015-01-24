//
//  QuizModel.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/19.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import UIKit
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
            var wordsString:[String] = []
            for word in question.words {
                wordsString.append(word.word)
            }
            
            var words = wordsString
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

        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        
        let wordEntity: NSEntityDescription! = NSEntityDescription.entityForName("Word", inManagedObjectContext: context)
        
        let request = NSFetchRequest()
        request.entity = wordEntity
        request.predicate = NSPredicate(format: "level = %d", level)
        var error:NSErrorPointer! = NSErrorPointer()

        if let results = context.executeFetchRequest(request, error: nil) {
            for var j = 0; j < 10; j++ {
                var checkRandomNumber = Dictionary<Int,String>()
                var answerWordIndex = Int(arc4random() % UInt32(results.count))
                checkRandomNumber[answerWordIndex] = "already exists"
            
                let wordModel = results[answerWordIndex] as Word
                let question = QuestionModel()
                question.answerIndex = 0
                question.answerMeaning = wordModel.answerMeaning
                
                var words:[Word] = []
                words.append(wordModel)
            
                for var i = 0; i < 3; i++ {
                    var randomNumver = Int(arc4random() % UInt32(results.count))
                    if let tmp = checkRandomNumber[randomNumver] {
                        i = i - 1
                        continue
                    }
                    checkRandomNumber[randomNumver] = "already exists"
                    let word = results[randomNumver] as Word
                    words.append(word)
                }
            
                question.words = words
                self.questions.append(question)
            }
        }
        

        // Until here
    }
    
    func preSaveWords() {
        let filePath = NSBundle.mainBundle().pathForResource("word.plist", ofType: nil)
        let dic = NSDictionary(contentsOfFile: filePath!)
        
        for var i = 1; i <= dic!.count; i++ {
            var item: NSArray  = dic![String(i)]! as NSArray
            self.insertData(item)
        }
    }
    
    func insertData(wordArray:NSArray){
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        let wordData: AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Word", inManagedObjectContext: context)

        let model = wordData as Aratan.Word
        model.word = wordArray[0] as String
        model.answerMeaning = wordArray[1] as String
        model.level = wordArray[2] as NSNumber
        context.save(nil)
    }

}