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
    
    var locationManager = CLLocationManager()
    var currentLocation = CLLocation()
    var localSearchResults = []
    var selectedDistance = 0.001

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "foodImage")
        // Image provided by Kely Brisson via flickr //
        self.view.insertSubview(backgroundImage, atIndex: 0)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        updateSearchResults()
    
}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getStartedButtonTapped(sender: AnyObject) {
        performSegueWithIdentifier("getStarted", sender: nil)
    }
    
    func updateSearchResults() {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Restaurants"
        
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler { (response, error) in
            guard let response = response else {
                print("Error \(error)")
                return
            }
            self.localSearchResults = response.mapItems
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "getStarted" {
            if let destinationViewController = segue.destinationViewController as? MapViewController {
                destinationViewController.currentLocation = currentLocation
            }
            
        }
    }

}

extension GettingStartedViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.currentLocation = location
        }
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error: \(error)")
    }
}
