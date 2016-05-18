//
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by Chad Watts on 5/16/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    weak var delegate: SwitchTableViewCellDelegate?
    
    @IBAction func switchValueChanged(sender: AnyObject) {
        delegate?.switchCellValueChanged(self)
    }
    
    func updateWithAlarm(alarm: Alarm) {
        timeLabel.text = alarm.fireTimeAsString
        nameLabel.text = alarm.name
        alarmSwitch.on = alarm.enabled
    }
    
}

protocol SwitchTableViewCellDelegate: class {
    func switchCellValueChanged(cell: SwitchTableViewCell)
}
