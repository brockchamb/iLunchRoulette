//
//  RouletteDetailViewController.swift
//  iLunchRoulette
//
//  Created by admin on 3/28/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import UIKit

class RouletteDetailViewController: UIViewController {
    
    var selectedRestaurantsList: [String] = []
    

    @IBOutlet weak var rouletteImage: UIImageView!
    
    @IBOutlet weak var winnerLabel: UILabel!

    @IBOutlet weak var getDirectionsButton: UIButton!
    
    @IBOutlet weak var rouletteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        rouletteView()
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "table")
        // Image provided by blazepress.com //
        self.view.insertSubview(backgroundImage, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func rouletteButtonTapped(sender: AnyObject) {
        createAnimation()
        rouletteWinner = randomRestaurantGenerator()
        winnerLabel.text = rouletteWinner ?? ""
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
    
    func switchToOptionsMode() {
        rouletteButton.hidden = true

    }
    
    func rouletteView() {
//        getDirectionsButton.hidden = true
//        callButton.hidden = true
    }
    
    func blurBackImage() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    func createAnimation() {
        
        let bounds = CGRectMake(0, 0, 1, 1)
        
        let rotateAnimation = CAKeyframeAnimation()
        rotateAnimation.keyPath = "position"
        rotateAnimation.path = CGPathCreateWithEllipseInRect(bounds, nil)
        rotateAnimation.duration = 1.0
        rotateAnimation.additive = true
        rotateAnimation.repeatCount = Float.init(50)
        rotateAnimation.rotationMode = kCAAnimationRotateAuto
        rotateAnimation.speed = 9.0
        
        
        self.rouletteImage.layer.addAnimation(rotateAnimation, forKey: "shake")
        
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
