//
//  TopViewController.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/21.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import UIKit

class TopViewController: UIViewController, UIActionSheetDelegate {
    
    var level = 3
    @IBOutlet weak var levelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadPreviousLevel()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPreviousLevel() {
        let ud = NSUserDefaults.standardUserDefaults()
        var level = ud.integerForKey("SelectedLevel")
        
        
        if level == 0 { // level is not initialized
            level = 1
        }
        
        
        self.setMyLevel(level)
    }
    func setMyLevel(level:Int) {
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setInteger(level, forKey: "SelectedLevel")
        self.level = level
        
        
        let image = UIImage(named: "level\(level).png")
        levelButton.setImage(image, forState: UIControlState.Normal)
        
    }
    
    func levelSelect(level:Int){
        setMyLevel(level)
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
    
    @IBAction func backFromListView(segue:UIStoryboardSegue){
        println("戻ってきたよ")
    }

}
