//
//  AppearanceController.swift
//  iLunchRoulette
//
//  Created by admin on 3/28/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import Foundation
import UIKit

class AppearanceController {
    
    static func initializeAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.188, green: 0.239, blue: 0.353, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UINavigationBar.appearance().barStyle = UIBarStyle.Default
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()

        UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()
        UISegmentedControl.appearance().tintColor = UIColor.whiteColor()
    }
}