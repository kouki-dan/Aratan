//
//  ViewController.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/18.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        OEPocketsphinxController.sharedInstance().setActive(true, error: nil)
        
        let lmGenerator = OELanguageModelGenerator()
        let words = ["WORD", "ALOUD", "SPEAK", "TANGO", "LEARNING"]
        let name = "NameIWantForMyLanguageModelFiles";
        
        let err = lmGenerator.generateLanguageModelFromArray(words,
            withFilesNamed: name,
            forAcousticModelAtPath: OEAcousticModel.pathToModel("AcousticModelEnglish"))
        

        if err == nil{
            let lmPath = lmGenerator.pathToSuccessfullyGeneratedLanguageModelWithRequestedName("NameIWantForMyLanguageModelFiles")
            let dicPath = lmGenerator.pathToSuccessfullyGeneratedDictionaryWithRequestedName("NameIWantForMyLanguageModelFiles")
        }
        else{
            print(err)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

