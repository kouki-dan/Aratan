//
//  QuizViewController.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/19.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    var quiz:QuizModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if quiz == nil {
            quiz = QuizModel()
            // It is for test.
            quiz.loadQuiz(1)
        }
        
    }
    
    func loadQuestion(){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

