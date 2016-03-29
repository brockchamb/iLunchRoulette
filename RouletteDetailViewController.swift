//
//  RouletteDetailViewController.swift
//  iLunchRoulette
//
//  Created by admin on 3/28/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import UIKit

class RouletteDetailViewController: UIViewController {
    
    var selectedRestaurantsList = []
    
    @IBOutlet weak var resultsImageOne: UIImageView!
    @IBOutlet weak var resultsImageTwo: UIImageView!
    @IBOutlet weak var resultsImageThree: UIImageView!
    @IBOutlet weak var resultsImageFour: UIImageView!
    @IBOutlet weak var resultsImageFive: UIImageView!
    @IBOutlet weak var resultsImageSix: UIImageView!
    
    @IBOutlet weak var getDirectionsButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    
    @IBOutlet weak var rouletteButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func rouletteButtonTapped(sender: AnyObject) {
        randomRestaurantGenerator()
    }
    
    func randomRestaurantGenerator() {
        let array = selectedRestaurantsList
        let randomRestaurant = Int(arc4random_uniform(UInt32(array.count)))
        print(array[randomRestaurant])
    }
    
    @IBAction func getDirectionsButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func callButtonTapped(sender: AnyObject) {
        
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
        getDirectionsButton.hidden = true
        callButton.hidden = true
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
