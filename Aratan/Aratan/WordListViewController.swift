//
//  WordListViewController.swift
//  Aratan
//
//  Created by kabutoya ryota on 2015/01/25.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import UIKit
import CoreData

class WordListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var wordsArray:[Word] = []
    var level = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.loadWordData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:WordListViewCell = self.tableView.dequeueReusableCellWithIdentifier("customCell") as WordListViewCell
        
        cell.putCell(wordsArray[indexPath.row], indexPath: indexPath)
        
        return cell
    }
    
    func loadWordData(){
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        wordsArray = []
        
        let wordEntity: NSEntityDescription! = NSEntityDescription.entityForName("Word", inManagedObjectContext: context)
        
        let request = NSFetchRequest()
        request.entity = wordEntity
        request.predicate = NSPredicate(format: "level = %d", self.level)
        var error:NSErrorPointer! = NSErrorPointer()
        
        if let results = context.executeFetchRequest(request, error: nil) {
            
            for res in results {
                let wordModel = res as Aratan.Word
                self.wordsArray.append(wordModel)
            }
        }
        
    }
    
    func setLevel(level:Int){
        self.level = level
    }
    
    func levelSelect(level:Int){
        setLevel(level)
    }
    
    @IBAction func levelChange(sender: AnyObject) {
        let actionSheet:UIAlertController = UIAlertController(title:"Levelを選んでください！",
            message: "Please select level you want to play!",
            preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        for var i = 1; i <= 5; i++ {
            {() -> Void in
                var level = i
                let levelAction:UIAlertAction = UIAlertAction(title: "Level \(i)",
                    style: UIAlertActionStyle.Default,
                    handler:{
                        (action:UIAlertAction!) -> Void in
                        self.levelSelect(level)
                        self.loadWordData()
                        self.tableView.reloadData()
                })
                
                actionSheet.addAction(levelAction)
                }()
        }
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler:{
                (action:UIAlertAction!) -> Void in
                println("Cancel")
        })
        actionSheet.addAction(cancelAction)
        
        self.presentViewController(actionSheet, animated: true, completion: nil)

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
