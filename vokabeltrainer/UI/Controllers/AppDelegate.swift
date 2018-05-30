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
        let languageSelectionController = LanguageSelectionController()
        languageSelectionController.hidden = false
        let navController = NavController(rootViewController: languageSelectionController)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "RightViewController") as! RightViewController
        let rightViewController = vc
        let rootController = AppNavigationDrawerController(
            rootViewController: navController,
            rightViewController: rightViewController)
        rootController.isLeftPanGestureEnabled = false
        rootController.isRightPanGestureEnabled = false
        window!.rootViewController = rootController
        window!.makeKeyAndVisible()
        
        return true
    }


}

