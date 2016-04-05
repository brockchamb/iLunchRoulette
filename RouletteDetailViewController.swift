//
//  RouletteDetailViewController.swift
//  iLunchRoulette
//
//  Created by admin on 3/28/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import UIKit
import MapKit

class RouletteDetailViewController: UIViewController {
    
    var selectedRestaurantsList: [String] = []
    
    @IBOutlet weak var rouletteSpinnerView: UIView!
    @IBOutlet weak var circleView: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    
    
    @IBOutlet weak var animatedWinnerLabel: UILabel!
    
    @IBOutlet weak var winnerLabel: UILabel!

    @IBOutlet weak var getDirectionsButton: UIButton!
    
    @IBOutlet weak var rouletteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "table")
        // Image provided by blazepress.com //
        self.view.insertSubview(backgroundImage, atIndex: 0)
        
        animatedWinnerLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func rouletteButtonTapped(sender: AnyObject) {
        createAnimation()
        fadeOut() // To make the UIView fade out
        scaleDown()
        rouletteWinner = randomRestaurantGenerator()
        animatedWinnerLabel.text = rouletteWinner ?? ""
        rouletteButton.hidden = true
        animatedWinnerLabel.hidden = false
        scaleUp()
    }
    
    @IBAction func getDirectionsButtonTapped(sender: AnyObject) {
        performSegueWithIdentifier("directionsSegue", sender: nil)
        print(rouletteWinner)
    }
    
    var rouletteWinner: String?
    
    func randomRestaurantGenerator() -> String {
        let array = selectedRestaurantsList
        let randomRestaurant = Int(arc4random_uniform(UInt32(array.count)))
        print(array[randomRestaurant])
        return array[randomRestaurant]
    }
    
    func createAnimation() {
        
        let bounds = CGRectMake(0, 0, 1, 1)
        
        let rotateAnimation = CAKeyframeAnimation()
        rotateAnimation.keyPath = "position"
        rotateAnimation.path = CGPathCreateWithEllipseInRect(bounds, nil)
        rotateAnimation.duration = 1.0
        rotateAnimation.additive = true
        rotateAnimation.repeatCount = Float.init(35)
        rotateAnimation.rotationMode = kCAAnimationRotateAuto
        rotateAnimation.speed = 7.0
        
        
        self.rouletteSpinnerView.layer.addAnimation(rotateAnimation, forKey: "shake")
        
    }
    
    // Function to make the UIView fade out
    func fadeOut(duration duration: NSTimeInterval = 5.0) {
        UIView.animateWithDuration(duration, animations: {
            self.rouletteSpinnerView.alpha = 0.0
        })
    }
    // Attempting to scale down the roulette view
    func scaleDown() {
        UIView.animateWithDuration(5.0, animations: {
            self.rouletteSpinnerView.transform = CGAffineTransformMakeScale(0.1, 0.1) },
                                   completion: { finish in
                                    UIView.animateWithDuration(5.0) {
                                        self.rouletteSpinnerView.transform = CGAffineTransformIdentity
                                    }
        })
    }
    
    func scaleUp() {
        UIView.animateWithDuration(2.0, animations: {
            self.animatedWinnerLabel.transform = CGAffineTransformMakeScale(0.0, 2.0) },
                                   completion: { finish in
                                    UIView.animateWithDuration(2.0) {
                                        self.animatedWinnerLabel.transform = CGAffineTransformIdentity
                                    }
        })
    }
    
    func getDirections(mapView: MKMapView) {
//        let mapItem = MKMapItem()
//        let location = rouletteWinner as! MKMapItem
//        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
//        location.mapItem()
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "directionsSegue" {
            if let destinationViewController = segue.destinationViewController as? DirectionsViewController {
                destinationViewController.winningRestaurant = rouletteWinner
            }
        }

    }
    

}







