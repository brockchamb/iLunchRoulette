//
//  Colors.swift
//  iLunchRoulette
//
//  Created by admin on 4/25/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import UIKit

class Color {
    let colorTop = UIColor(red: 0.188, green: 0.239, blue: 0.353, alpha: 1.0).CGColor
    let colorBottom = UIColor(red: 0.184, green: 0.427, blue: 0.506, alpha: 1.0).CGColor
    
    let gl: CAGradientLayer
    
    init() {
        gl = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 1.0]
    }
}
