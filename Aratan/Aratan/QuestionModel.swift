//
//  QuestionModel.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/19.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import Foundation

class QuestionModel{
    var words:[String] = []// please replace this type, such as Word class
    var answerIndex:Int = 0
    var answerMeaning:String = ""
    
    //please implement init function
    
    func checkAnswer(word:String) -> Bool {
        if word == words[answerIndex] {
            return true
        }
        return false
    }
}