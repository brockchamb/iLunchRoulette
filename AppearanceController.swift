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
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.078, green: 0.063, blue: 0.118, alpha: 1.00)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

        UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()
        UISegmentedControl.appearance().tintColor = UIColor.whiteColor()
        
//        UITableViewCell.appearance().tintColor = UIColor(red: 0.294, green: 0.180, blue: 0.145, alpha: 1.00)
    }
}