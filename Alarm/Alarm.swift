//
//  Alarm.swift
//  Alarm
//
//  Created by Chad Watts on 5/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
    
class Alarm: NSObject, NSCoding {
    private let theFireTimeFromMidnight = "fireTimeFromMidnight"
    private let theName = "name"
    private let theEnabled = "enabled"
    private let theUUID = "UUID"
    
    var fireTimeFromMidnight: NSTimeInterval
    var name: String
    var enabled: Bool
    let uuid: String
    
    var fireDate: NSDate? {
        guard let thisMorningAtMidnight = DateHelper.thisMorningAtMidnight else {return nil}
        let fireDateFromThisMorning = NSDate(timeInterval: fireTimeFromMidnight, sinceDate: thisMorningAtMidnight)
        return fireDateFromThisMorning
    }
    
    var fireTimeAsString: String {
        let fireTimeFromMidnight = Int(self.fireTimeFromMidnight)
        let hours = fireTimeFromMidnight/60/60
        let minutes = (fireTimeFromMidnight - (hours*60*60))/60
        if hours >= 13 {
            return String(format: "%2d:%02d PM", arguments: [hours - 12, minutes])
        } else if hours >= 12 {
            return String(format: "%2d:%02d PM", arguments: [hours, minutes])
        } else {
            return String(format: "%2d:%02d AM", arguments: [hours, minutes])
        }
    }
    
    init(fireTimeFromMidnight: NSTimeInterval, name: String, enabled: Bool = true, uuid: String = NSUUID().UUIDString) {
        self.fireTimeFromMidnight = fireTimeFromMidnight
        self.name = name
        self.enabled = enabled
        self.uuid = uuid
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let fireTimeFromMidnight = aDecoder.decodeObjectForKey(theFireTimeFromMidnight) as? NSTimeInterval,
            name = aDecoder.decodeObjectForKey(theName) as? String,
            enabled = aDecoder.decodeObjectForKey(theEnabled) as? Bool,
            uuid = aDecoder.decodeObjectForKey(theUUID) as? String else {return nil}
        
        self.fireTimeFromMidnight = fireTimeFromMidnight
        self.name = name
        self.enabled = enabled
        self.uuid = uuid
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(fireTimeFromMidnight, forKey: theFireTimeFromMidnight)
        aCoder.encodeObject(name, forKey: theName)
        aCoder.encodeObject(enabled, forKey: theEnabled)
        aCoder.encodeObject(uuid, forKey: theUUID)
    }
    
}

func ==(lhs: Alarm, rhs: Alarm) -> Bool {
    return lhs.uuid == rhs.uuid
}