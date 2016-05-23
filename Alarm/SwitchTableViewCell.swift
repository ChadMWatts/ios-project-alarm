//
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by Chad Watts on 5/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    weak var delegate = SwitchTableViewCellDelegate?()
    
    func updateWithAlarm(alarm: Alarm) {
        timeLabel.text = alarm.fireTimeAsString
        nameLabel.text = alarm.name
        alarmSwitch.on = alarm.enabled
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func switchValueChanged(sender: AnyObject) {
        delegate?.switchCellValueChanged(self)
    }
    
}

protocol SwitchTableViewCellDelegate: class {
    
    func switchCellValueChanged(cell: SwitchTableViewCell)
}