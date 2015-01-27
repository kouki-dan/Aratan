//
//  QuestionModel.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/19.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import Foundation

class QuestionModel{
    var words:[Word]
    var answerIndex:Int
    var answerMeaning:String
    var answerFlag:Bool
    
    init(){
        self.words = []
        self.answerIndex = 0
        self.answerMeaning = ""
        self.answerFlag = false
    }
    
    init(_ words:[Word],_ answerIndex:Int,_ answerMeaning:String){
        self.words = words
        self.answerIndex = answerIndex
        self.answerMeaning = answerMeaning
        self.answerFlag = false
    }

    func checkAnswer(word:String) -> Bool {
        if word.uppercaseString == words[answerIndex].word.uppercaseString {
            return true
        }
        return false
    }
}