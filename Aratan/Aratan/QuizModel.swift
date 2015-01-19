//
//  QuizModel.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/19.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import Foundation

class QuizModel{
    var questions:[QuestionModel]
    init(){
        questions = []
    }
    init(_ questions:[QuestionModel]){
        self.questions = questions
    }
    
    func loadQuiz(level:Int){
        // Please implement this.
        // Load a words from CoreData and construct this questions array.
        
        // The below is code for testing
        // TODO: Write!!
        
        let wordsArray = [
            ["WORD", "ALOUD", "SPEAK", "TANGO"],
            ["TEST", "PLAY", "FIX", "SUPER"],
            ["HAVE", "RICH", "GOOD", "Python"],
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