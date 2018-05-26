//
//  Tools.swift
//  sightseeker
//
//  Created by Philipp Matthes on 17.05.18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

class Tools {
    static let lastDateKey = "lastDateOfUse"
    
    static func appWasLaunchedBefore() -> Bool {
        var appWasLaunchedBefore: Bool
        if let _ = UserDefaults.standard.object(forKey: Tools.lastDateKey) as? NSDate {
            appWasLaunchedBefore = true
        } else {
            appWasLaunchedBefore = false
        }
        UserDefaults.standard.set(NSDate(), forKey: Tools.lastDateKey)
        return appWasLaunchedBefore
    }
    
    static func lastAppLaunchDate() -> NSDate? {
        return UserDefaults.standard.object(forKey: Tools.lastDateKey) as? NSDate
    }
}
