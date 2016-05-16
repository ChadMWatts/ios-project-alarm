//
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by Chad Watts on 5/16/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLable: UITextField!
    @IBOutlet weak var nameLable: UITextField!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchValueChanged(sender: UISwitch) {
    }
}
