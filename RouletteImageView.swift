//
//  ImagePractice.swift
//  iLunchRoulette
//
//  Created by admin on 4/1/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import UIKit

@IBDesignable
class RouletteImageView: UIImageView {

    override func awakeFromNib() {
        setupView()
    }
    
    override func drawRect(rect: CGRect) {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
    override func prepareForInterfaceBuilder()
    {
        super.prepareForInterfaceBuilder()
        setupView()
    }
 

}
