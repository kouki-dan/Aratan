//
//  ResultViewController.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/21.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var quizResult:QuizModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let questionCount = quizResult?.questions.count{
            return questionCount
        }
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Word", forIndexPath: indexPath) as ResultWordTableViewCell
        
        // Configure the cell...
        let question = quizResult?.getQuestion(indexPath.row)
        cell.wordLabel.text = question?.getAnswer()
        
        let correct = question?.isCorrect()
        cell.correct(correct!)
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
