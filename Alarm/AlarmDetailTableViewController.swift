//
//  AlarmDetailTableViewController.swift
//  Alarm
//
//  Created by Chad Watts on 5/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController, AlarmScheduler {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var enableButton: UIButton!
    
    var alarm: Alarm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let alarm = alarm {
            updateWithAlarm(alarm)
        }
        setupView()
    }
    
    func setupView() {
        if alarm == nil {
            enableButton.hidden = true
            
        } else {
            
            enableButton.hidden = false
            if alarm?.enabled == true {
                
                enableButton.setTitle("Disable", forState: .Normal)
                enableButton.setTitleColor(.whiteColor(), forState: .Normal)
                enableButton.backgroundColor = .redColor()
                
            } else {
                
                enableButton.setTitle("Enable", forState: .Normal)
                enableButton.setTitleColor(.blueColor(), forState: .Normal)
                enableButton.backgroundColor = .grayColor()
            }
        }
    }
    
    func updateWithAlarm(alarm: Alarm) {
        guard let thisMorningAtMidnight = DateHelper.thisMorningAtMidnight else {return}
        datePicker.setDate(NSDate(timeInterval: alarm.fireTimeFromMidnight, sinceDate: thisMorningAtMidnight), animated: false)
        textField.text = alarm.name
        self.title = alarm.name
    }

    
    @IBAction func enableButtonTapped(sender: AnyObject) {
        
        guard let alarm = alarm else {return}
        AlarmController.sharedController.toggleEnabled(alarm)
        
        if alarm.enabled {
            
            scheduleLocalNotification(alarm)
            
        } else {
            
            cancelLocalNotification(alarm)
        }
        
        setupView()
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        guard let title = textField.text,
            thisMorningAtMidnight = DateHelper.thisMorningAtMidnight else {return}
        let timeIntervalSinceMidnight = datePicker.date.timeIntervalSinceDate(thisMorningAtMidnight)
        
        if let alarm = alarm {
            
            AlarmController.sharedController.updateAlarm(alarm, fireTimeFromMidnight: timeIntervalSinceMidnight, name: title)
            cancelLocalNotification(alarm)
            scheduleLocalNotification(alarm)
            
        } else {
            
            let alarm = AlarmController.sharedController.addAlarm(timeIntervalSinceMidnight, name: title)
            self.alarm = alarm
            scheduleLocalNotification(alarm)
            
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
