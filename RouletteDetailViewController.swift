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
    
    @IBOutlet weak var resultsImageOne: UIImageView!
    @IBOutlet weak var resultsImageTwo: UIImageView!
    @IBOutlet weak var resultsImageThree: UIImageView!
    @IBOutlet weak var resultsImageFour: UIImageView!
    @IBOutlet weak var resultsImageFive: UIImageView!
    @IBOutlet weak var resultsImageSix: UIImageView!
    
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
        resultsImageOne.hidden = true
        resultsImageTwo.hidden = true
        resultsImageThree.hidden = true
        resultsImageFour.hidden = true
        resultsImageFive.hidden = true
        resultsImageSix.hidden = true
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

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "directionsSegue" {
            if let destinationViewController = segue.destinationViewController as? DirectionsViewController {
                destinationViewController.winningRestaurant = rouletteWinner
            }
        }

    }
    

}
