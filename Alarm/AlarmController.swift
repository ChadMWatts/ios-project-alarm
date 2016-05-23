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
    
    func addAlarm(fireTimeFromMidnight: NSTimeInterval, name: String) {
        
        let alarm = Alarm(fireTimeFromMidnight: fireTimeFromMidnight, name: name)
        alarms.append(alarm)
        return alarm
    }
    
}
