//
//  TableViewController.swift
//  Reminders
//
//  Created by Komal Hirani on 2/6/17.
//  Copyright © 2017 Khiranindustries. All rights reserved.
//

import UIKit


var itemsArray = [ReminderItem]()

class TableViewController: UITableViewController {
    
    //@IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemsArray.count
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
        let item = itemsArray[indexPath.row]
        cell.reminderItems = item
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if (item.completed) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        //cell.accessoryType = .none
        //cell.accessoryType = UITableViewCellAccessoryCheckmark
        
        return cell

        // Configure the cell...
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        
        //var item : ReminderItem?
        let complete = UITableViewRowAction(style: .normal, title: "Mark") { action, index in
            let completedItem : ReminderItem = itemsArray[editActionsForRowAt.row]
            //print(completedItem.completed)
            //item = completedItem
            let cell = tableView.cellForRow(at: editActionsForRowAt)
            //completedItem.completed = !completedItem.completed
            if (completedItem.completed) {
                //self.title = "Complete"
                cell?.accessoryType = .checkmark
                completedItem.completed = false
                //self.completed = true
            } else {
                cell?.accessoryType = .none
                completedItem.completed = true
                //self.completed = false
            }
            //print(self.completed)
            //tableView.reloadData()
            tableView.reloadRows(at: [index], with: .right)
            
            
            
        }
        complete.backgroundColor = .green
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            itemsArray[editActionsForRowAt.row].completed = false
            itemsArray.remove(at: editActionsForRowAt.row)
            tableView.deleteRows(at: [editActionsForRowAt], with: .fade)
            //tableView.reloadData()
        }
        delete.backgroundColor = .red
        //tableView.reloadData()
        
        return [complete, delete]
    }


}
