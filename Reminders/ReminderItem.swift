//
//  ReminderItem.swift
//  Reminders
//
//  Created by Komal Hirani on 2/6/17.
//  Copyright © 2017 Khiranindustries. All rights reserved.
//

import UIKit

class ReminderItem: AnyObject {
    
    var itemName : String?
    var completed : Bool = false
    
    init(name:String) {
        self.itemName = name
    }
    

}
