//
//  WordRecognition.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/18.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import Foundation

protocol WordsRecognitionDelegate {
    func recognizedWord(word:String)
}

class WordsRecognition: NSObject, OEEventsObserverDelegate{
    var wordsArray:[[String]];
    var modelPaths:[String] = []
    var dicPaths:[String] = []
    var amPath:String = ""
    var nowIndex = 0;
    var delegate:WordsRecognitionDelegate!
    
    var openEarsEventsObserver = OEEventsObserver()
    
    init(_ wordsArray:[[String]]){
        self.wordsArray = wordsArray
        super.init()

        
        OEPocketsphinxController.sharedInstance().setActive(true, error: nil)
        openEarsEventsObserver.delegate = self
        
        let lmGenerator = OELanguageModelGenerator()
        amPath = OEAcousticModel.pathToModel("AcousticModelEnglish")
        
        for words in self.wordsArray{
            let key = join("-", words)
            
            let err = lmGenerator.generateLanguageModelFromArray(words,
                withFilesNamed: key,
                forAcousticModelAtPath: amPath)
            if err == nil{
                let lmPath = lmGenerator.pathToSuccessfullyGeneratedLanguageModelWithRequestedName(key)
                let dicPath = lmGenerator.pathToSuccessfullyGeneratedDictionaryWithRequestedName(key)
                
                modelPaths.append(lmPath)
                dicPaths.append(dicPath)
            }
            else{
                print("変だよー")
            }
        }
        listen(0)
    }
    
    func listen(index:Int){
        if OEPocketsphinxController.sharedInstance().isListening {
            OEPocketsphinxController.sharedInstance().changeLanguageModelToFile(modelPaths[index],
                withDictionary: dicPaths[index])
        }
        else {
            OEPocketsphinxController.sharedInstance().startListeningWithLanguageModelAtPath(modelPaths[index],
                dictionaryAtPath: dicPaths[index],
                acousticModelAtPath: amPath,
                languageModelIsJSGF: false)
            println("OK");
        }

    }
    
    func pocketsphinxDidReceiveHypothesis(hypothesis: String!, recognitionScore: String!, utteranceID: String!) {
        println("-------------")
        println(hypothesis)
        println(recognitionScore)
        println("-------------")
        
        self.delegate.recognizedWord(hypothesis)
        
        /*
        if hypothesis == "NEXT"{
            self.nowIndex += 1
            listen(self.nowIndex)
        }
        */
    }
    
    
    
}