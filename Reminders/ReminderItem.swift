//
//  ReminderItem.swift
//  Reminders
//
//  Created by Komal Hirani on 2/6/17.
//  Copyright © 2017 Khiranindustries. All rights reserved.
//

import UIKit

class ReminderItem: NSObject {
    
    var itemName : NSString?
    var completed : Bool = false
    
    init(name:String) {
        self.itemName = name as NSString?
        
    }
    

}
