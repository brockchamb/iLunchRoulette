//
//  MapViewController.swift
//  iLunchRoulette
//
//  Created by admin on 3/24/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    var localSearchResults: [MKMapItem] = []
    var selectedDistance = 0.001
    var currentLocation = CLLocation()
    var selectedRestaurantsArray: [MKMapItem] = []
    
    func convertMilesIntoMeters(miles: Double) -> Double {
        let meters = miles / 0.00062137
        print(meters)
        return meters
    }
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectButton: UIBarButtonItem!
    @IBOutlet weak var loadingDataIndicator: UIActivityIndicatorView!
    
    
    @IBAction func distanceSegmentedController(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            selectedDistance = convertMilesIntoMeters(1)
            let region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude), selectedDistance / 2, selectedDistance / 2)
            mapView.region = region
            updateSearchResults()
            
        } else if sender.selectedSegmentIndex == 1 {
            selectedDistance = convertMilesIntoMeters(2)
            let region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude), selectedDistance / 2, selectedDistance / 2)
            mapView.region = region
            updateSearchResults()
            
        } else if sender.selectedSegmentIndex == 2 {
            selectedDistance = convertMilesIntoMeters(5)
            let region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude), selectedDistance / 2, selectedDistance / 2)
            mapView.region = region
            updateSearchResults()
        }
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func selectButtonTapped(sender: AnyObject) {
        if selectedRestaurantsArray.count <= 1 {
            selectRestaurantNotification()
        } else {
            performSegueWithIdentifier("selectedIdentifier", sender: nil)
        }
        
    }
    
    func updateSearchResults() {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Restaurants"
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler { (response, error) in
            guard let response = response else {
                print("Error \(error)")
                return
            }
            self.localSearchResults = response.mapItems
            self.loadingDataIndicator.stopAnimating()
            self.loadingDataIndicator.hidesWhenStopped = true
            self.tableView.reloadData()
        }
    }
    
    func selectRestaurantNotification() {
        let alertController = UIAlertController(title: "No Restaurant Selected", message: "Select Restaurant To Proceed", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertController.addAction(action)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
//    var refreshControl =  UIRefreshControl()
//    
//    func refresh() {
//        self.updateSearchResults()
//        self.tableView.reloadData()
//        self.refreshControl.endRefreshing()
//        
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingDataIndicator.startAnimating()

        self.tableView.allowsMultipleSelection = true
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
//        self.refreshControl = UIRefreshControl()
//        self.refreshControl.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
//        self.tableView.addSubview(self.refreshControl)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


    //Mark: - TableView Delegates

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantCell", forIndexPath: indexPath)
        let restaurant = self.localSearchResults[indexPath.row] 
        cell.textLabel?.text = restaurant.name!
        let bgColorView = UIView()
        bgColorView.backgroundColor = (UIColor.init(red: 0.149, green: 0.349, blue: 0.502, alpha: 1.00))
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.localSearchResults.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
        print(indexPath.row)
        print(selectedRestaurantsArray.count)
        let mapItem = localSearchResults[indexPath.row]
        selectedRestaurantsArray.append(mapItem)
        print(selectedRestaurantsArray)
        
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.None
        print(indexPath.row)
        print(selectedRestaurantsArray.count)
        let index = selectedRestaurantsArray.indexOf(localSearchResults[indexPath.row])
        selectedRestaurantsArray.removeAtIndex(index!)
        print(selectedRestaurantsArray)
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if let selectedRow = tableView.indexPathsForSelectedRows {
            if selectedRow.count == 8 {
                let alertController = UIAlertController(title: "Oops!", message: "Selected more than 8 places", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in}))
                self.presentViewController(alertController, animated: true, completion: nil)
                
                return nil
            }
        }
        
        return indexPath
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "selectedIdentifier" {
            if let destinationViewController = segue.destinationViewController as? RouletteDetailViewController {
                
                destinationViewController.selectedRestaurantsList = selectedRestaurantsArray
            }
        }
    }
    
}

    //Mark: - Location Delegate

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.currentLocation = location
            let span = MKCoordinateSpanMake(selectedDistance, selectedDistance)
            let region = MKCoordinateRegionMake(location.coordinate, span)
            mapView.setRegion(region, animated: true)
            updateSearchResults()
        }
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error: \(error)")
    }
}

