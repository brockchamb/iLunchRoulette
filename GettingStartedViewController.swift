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
    
    let colors = Color()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh()
//        
//        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
//        backgroundImage.image = UIImage(named: "foodImage")
//        // Image provided by Kely Brisson via flickr //
//        self.view.insertSubview(backgroundImage, atIndex: 0)

    
}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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