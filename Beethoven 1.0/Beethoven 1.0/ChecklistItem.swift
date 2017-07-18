//
//  ChecklistItem.swift
//  Beethoven 1.0
//
//  Created by BLVCK on 14.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import Foundation
import UserNotifications

class ChecklistItem: NSObject, NSCoding {
    
    var text = " "
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    //var itemID: Int
    
    func toggleChecked() {
        checked = !checked
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
        
        aCoder.encode(dueDate, forKey: "DueDate")
        aCoder.encode(shouldRemind, forKey: "ShouldRemind")
        //aCoder.encode(itemID, forKey: "ItemID")
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        
        dueDate = aDecoder.decodeObject(forKey: "DueDate") as! Date
        shouldRemind = aDecoder.decodeBool(forKey: "ShouldRemind")
        //itemID = aDecoder.decodeInteger(forKey: "ItemID")
        
        super.init()
    }
    
    override init() {
        
        super.init()
    }
    
    func scheduleNotifications(){
        if shouldRemind && dueDate > Date() {

            let content = UNMutableNotificationContent()
            content.title = "Напоминание"
            content.body = text
            content.sound = UNNotificationSound.default()
            
            let calendar = Calendar(identifier: .iso8601)
            let components = calendar.dateComponents([.month, .day, .hour, .minute,], from: dueDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            let center = UNUserNotificationCenter.current()
            center.add(request)
            
        }
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

