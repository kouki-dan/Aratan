//
//  QuizViewController.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/19.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let wordsArray = [
            ["WORD", "ALOUD", "SPEAK", "TANGO", "LEARNING", "NEXT"],
            ["TEST", "PLAY", "FIX", "SUPER", "GOING", "NEXT"],
            ["HAVE", "RICH", "GOOD", "Python", "MAIN", "NEXT"],
            ["PRODUCT", "SCIENCE", "HEAD", "MAINTAIN", "NOW", "NEXT"],
            ["TRAIN", "CREED", "STATUE", "LIBERTY", "LITTLE", "NEXT"],
            ["REALIZE", "OBJECT", "ART", "ABSTRACT", "RICHIE", "NEXT"],
            ["IMPULSE", "SOMETHING", "SALE", "LUXURIES", "PURCHASE", "NEXT"],
            ["ANTICIPATE", "EMPLOY", "CUT", "COMPETENT", "MECHANIC", "NEXT"],
            ["BIRTHRATE", "STEADILY", "INHABITANT", "MUCH", "RECOMMEND", ],
        ]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

