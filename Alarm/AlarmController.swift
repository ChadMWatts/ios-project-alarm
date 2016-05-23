//
//  AlarmController.swift
//  Alarm
//
//  Created by Chad Watts on 5/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class AlarmController {
    
    static let sharedController = AlarmController()
    
    var alarms: [Alarm] = []
    
    var mockAlarms: [Alarm] {
        
        var wakeUpAlarm = Alarm(fireTimeFromMidnight: 0600, name: "wakeUpAlarm")
        var schoolAlarm = Alarm(fireTimeFromMidnight: 1200, name: "School Alarm")
        var breakAlarm = Alarm(fireTimeFromMidnight: 0500, name: "Break Alarm")
        
        return [wakeUpAlarm, schoolAlarm, breakAlarm]
    }
    
    init () {
       alarms = mockAlarms
    }
    
    
    func addAlarm(fireTimeFromMidnight: NSTimeInterval, name: String) -> Alarm {
        
        let alarm = Alarm(fireTimeFromMidnight: fireTimeFromMidnight, name: name)
        alarms.append(alarm)
        return alarm
    }
    
    func updateAlarm(alarm: Alarm, fireTimeFromMidnight: NSTimeInterval, name: String) {
        
        alarm.fireTimeFromMidnight = fireTimeFromMidnight
        alarm.name = name
    }
    
    func deleteAlarm(alarm: Alarm) {
        
        guard let index = alarms.indexOf(alarm) else { return }
        alarms.removeAtIndex(index)
    }
    
    func toggleEnabled(alarm: Alarm) {
        
        alarm.enabled = !alarm.enabled
        
    }
    
}
