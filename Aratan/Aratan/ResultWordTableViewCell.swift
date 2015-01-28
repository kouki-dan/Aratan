//
//  ResultWordTableViewCell.swift
//  Aratan
//
//  Created by Kouki Saito on 2015/01/28.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import UIKit

let correctImagePath = "small_correct.png"
let wrongImagePath = "small_wrong.png"

class ResultWordTableViewCell: UITableViewCell {


    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var correctImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func correct(isCorrect:Bool){
        if isCorrect {
            correctImageView.image = UIImage(named: correctImagePath)
        }
        else {
            correctImageView.image = UIImage(named: wrongImagePath)
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
