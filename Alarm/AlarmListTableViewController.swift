//
//  AlarmListTableViewController.swift
//  Alarm
//
//  Created by Chad Watts on 5/16/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController, SwitchTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table View
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmController.sharedController.alarms.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("alarmSegue", forIndexPath: indexPath) as? SwitchTableViewCell ?? SwitchTableViewCell()
        
        let alarm = AlarmController.sharedController.alarms[indexPath.row]
        cell.updateWithAlarm(alarm)
        cell.delegate = self
        
        return cell
    }
    
    // Override to support 
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let alarm = AlarmController.sharedController.alarms[indexPath.row]
            AlarmController.sharedController.deleteAlarm(alarm)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell) {
        guard let indexPath = tableView.indexPathForCell(cell) else {return}
        let alarm = AlarmController.sharedController.alarms[indexPath.row]
        AlarmController.sharedController.toggleEnabled(alarm)
        if alarm.enabled {
            
        } else {
           
        }
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as? AlarmDetailTableViewController
        if segue.identifier == "toAlarmDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let alarm = AlarmController.sharedController.alarms[indexPath.row]
            detailVC?.alarm = alarm
        }
    }
    
}


