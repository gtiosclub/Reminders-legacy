//
//  TableViewCell.swift
//  Reminders
//
//  Created by Komal Hirani on 2/6/17.
//  Copyright © 2017 Khiranindustries. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UITextFieldDelegate {
    
    let label: UITextField
    
    var reminderItems:ReminderItem? {
        didSet {
            label.text = reminderItems!.itemName
        }
    }
    let leftMarginForLabel: CGFloat = 15.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: leftMarginForLabel, y: 0, width: bounds.size.width - leftMarginForLabel, height: bounds.size.height)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        // 1
        label = UITextField(frame: .null)
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 2
        label.delegate = self
        label.contentVerticalAlignment = .center
        // 3
        addSubview(label)
        
    }
    
    //required by UITableViewCell
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            reminderItems?.itemName = textField.text
        return true
    }

    //When an object receives an awakeFromNib message, it is guaranteed to have all its outlet and action connections already established.
   /* override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/

}
