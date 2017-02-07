//
//  AddItemVC.swift
//  Reminders
//
//  Created by Komal Hirani on 2/6/17.
//  Copyright © 2017 Khiranindustries. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {
    
    var item:ReminderItem?

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonSelected(_ sender: Any) {
        if (self.textField.text?.utf16.count)! > 0{
            self.item = ReminderItem(name: self.textField.text!)
            itemsArray.append(self.item!)
            _ = navigationController?.popViewController(animated: true)
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
