//
//  Word.swift
//  Aratan
//
//  Created by kabutoya ryota on 2015/01/21.
//  Copyright (c) 2015年 Team. Aratan. All rights reserved.
//

import Foundation
import CoreData

class Word: NSManagedObject {

    @NSManaged var answerMeaning: String
    @NSManaged var level: NSNumber
    @NSManaged var word: String

}
