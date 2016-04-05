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
    
    @IBOutlet weak var iLunchRouletteLabel: UILabel!
    
    @IBOutlet weak var getStartedButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "foodImage")
        // Image provided by Kely Brisson via flickr //
        self.view.insertSubview(backgroundImage, atIndex: 0)

    
}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getStartedButtonTapped(sender: AnyObject) {

    }

}