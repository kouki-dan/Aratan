//
//  QuestionModel.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/19.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import Foundation

class QuestionModel{
    var questionWord:String
    var words:[String]
    var answerIndex:Int
    var answerMeaning:String
    
    init(){
        self.questionWord = ""
        self.words = []
        self.answerIndex = 0
        self.answerMeaning = ""
    }
    
    init(_ questionWord:String,_ words:[String],_ answerIndex:Int,_ answerMeaning:String){
        self.questionWord = questionWord
        self.words = words
        self.answerIndex = answerIndex
        self.answerMeaning = answerMeaning
    }

}