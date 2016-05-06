//
//  GettingStartedViewController.swift
//  iLunchRoulette
//
//  Created by admin on 3/30/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class GettingStartedViewController: UIViewController {
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBOutlet weak var iLunchLogoImageView: UIImageView!
    
    let colors = Color()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh()
}

    
    @IBAction func getStartedButtonTapped(sender: AnyObject) {

    }
    
    func refresh() {
        view.backgroundColor = UIColor.clearColor()
        let backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
    }

}