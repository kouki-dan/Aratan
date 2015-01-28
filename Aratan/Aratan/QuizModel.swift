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
    
    func getQuestion(index:Int) -> QuestionModel {
        return questions[index]
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
            for j in 0..<10 {
                var checkRandomNumber = Dictionary<Int,String>()
            
                var answerWordIndex = self.getRandomIndex(results.count)
                checkRandomNumber[answerWordIndex] = "already exists"
                let answerWordModel = results[answerWordIndex] as Word
                
                var words:[Word] = []
                words.append(answerWordModel)
            
                for var i = 0; i < 3; i++ {
                    var randomIndex = self.getRandomIndex(results.count)
                    if let tmp = checkRandomNumber[randomIndex] {
                        i = i - 1
                        continue
                    }
                    checkRandomNumber[randomIndex] = "already exists"
                    let wordModel = results[randomIndex] as Word
                    words.append(wordModel)
                }
                
                let question = QuestionModel()
                question.words = words
                question.answerIndex = 0
                question.answerMeaning = answerWordModel.answerMeaning
                self.questions.append(question)
            }
        }
        

        // Until here
    }
    
    func getRandomIndex(maxNumber:Int) -> Int{
        return Int(arc4random() % UInt32(maxNumber))
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