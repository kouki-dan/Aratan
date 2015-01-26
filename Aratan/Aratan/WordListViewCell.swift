//
//  WordListViewCell.swift
//  Aratan
//
//  Created by kabutoya ryota on 2015/01/25.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import UIKit

class WordListViewCell: UITableViewCell {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func putCell(wordModel:Word, indexPath:NSIndexPath){
        wordLabel.text = wordModel.word
        meaningLabel.text = wordModel.answerMeaning
    }

}
