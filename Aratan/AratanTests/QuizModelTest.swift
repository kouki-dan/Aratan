//
//  QuizModelTest.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/20.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import XCTest

class QuizModelTest: XCTestCase {
    var quizModel:QuizModel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
        var questions:[QuestionModel] = []
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
            questions.append(question)
        }
        
        quizModel = QuizModel(questions)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
