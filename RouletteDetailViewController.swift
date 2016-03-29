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
    
    @IBOutlet weak var winnerLabel: UILabel!

    
    @IBOutlet weak var rouletteButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        rouletteView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func rouletteButtonTapped(sender: AnyObject) {
                rouletteRotation()
       let restaurant = randomRestaurantGenerator()

        winnerLabel.text = restaurant
    }
    
    func randomRestaurantGenerator() -> String {
        let array = selectedRestaurantsList
        let randomRestaurant = Int(arc4random_uniform(UInt32(array.count)))
        print(array[randomRestaurant])
        return array[randomRestaurant] as! String
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
    
    func rouletteRotation() {
        let boundingRect = CGRectMake(-220, 0, 200, 200)

        let orbitAnimation = CAKeyframeAnimation()
                orbitAnimation.keyPath = "position"
                orbitAnimation.path = CGPathCreateWithEllipseInRect(boundingRect, nil)
                orbitAnimation.duration = 0.80
                orbitAnimation.additive = true
                orbitAnimation.repeatCount = Float.init(4)
                orbitAnimation.calculationMode = kCAAnimationPaced
                orbitAnimation.rotationMode = kCAAnimationRotateAuto
        
        resultsImageOne.layer.addAnimation(orbitAnimation, forKey: "orbit")
//        resultsImageTwo.layer.addAnimation
//        resultsImageThree.layer.addAnimation(orbitAnimation, forKey: "orbit")
//        resultsImageFour.layer.addAnimation(orbitAnimation, forKey: "orbit")
//        resultsImageFive.layer.addAnimation(orbitAnimation, forKey: "orbit")
//        resultsImageSix.layer.addAnimation(orbitAnimation, forKey: "orbit")
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
