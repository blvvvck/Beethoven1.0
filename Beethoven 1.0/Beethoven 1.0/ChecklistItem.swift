//
//  ChecklistItem.swift
//  Beethoven 1.0
//
//  Created by BLVCK on 14.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    
    var text = " "
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }
    
    /*var dueDate = Date()
    var shouldRemind = false
    var itemID: Int
    
    required init?(coder aDecoder: NSCoder) {
        dueDate = aDecoder.decodeObject(forKey: "DueDate") as! Date
        shouldRemind = aDecoder.decodeBool(forKey: "ShouldRemind")
        itemID = aDecoder.decodeInteger(forKey: "ItemID")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(dueDate, forKey: "DueDate")
        aCoder.encode(shouldRemind, forKey: "ShouldRemind")
        aCoder.encode(itemID, forKey: "ItemID")
    }*/

    
}

