//
//  AlarmController.swift
//  Alarm
//
//  Created by Chad Watts on 5/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class AlarmController {
    
    static let sharedController = AlarmController()
    private let theAlarms = "alarms"
    var alarms: [Alarm] = []
    
    init() {
        loadFromPersistentStorage()
    }
    
    func addAlarm(fireTimeFromMidnight: NSTimeInterval, name: String) -> Alarm {
        let alarm = Alarm(fireTimeFromMidnight: fireTimeFromMidnight, name: name)
        alarms.append(alarm)
        saveToPersistentStorage()
        return alarm
    }
    
    func updateAlarm(alarm: Alarm, fireTimeFromMidnight: NSTimeInterval, name: String) {
        alarm.fireTimeFromMidnight = fireTimeFromMidnight
        alarm.name = name
        saveToPersistentStorage()
    }
    
    func deleteAlarm(alarm: Alarm) {
        guard let index = alarms.indexOf(alarm) else {return}
        alarms.removeAtIndex(index)
        saveToPersistentStorage()
    }
    
    func toggleEnabled(alarm: Alarm) {
        alarm.enabled = !alarm.enabled
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        NSKeyedArchiver.archiveRootObject(self.alarms, toFile: filePath(theAlarms))
    }
    
    func loadFromPersistentStorage() {
        guard let alarms = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath(theAlarms)) as? [Alarm] else {return}
        self.alarms = alarms
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }
    
}

