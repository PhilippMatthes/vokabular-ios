//
//  AppDelegate.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import UIKit
import SwiftRater
import Material

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        SwiftRater.setUpFor(Config.debugSwiftRater ? .testing : .distributing)
        
        window = UIWindow(frame: Screen.bounds)
        window!.rootViewController = NavController(rootViewController: LanguageSelectionController())
        window!.makeKeyAndVisible()
        
        return true
    }


}

