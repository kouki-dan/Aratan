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

    @IBOutlet weak var wordLabel: NSLayoutConstraint!
    @IBOutlet weak var correctImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
