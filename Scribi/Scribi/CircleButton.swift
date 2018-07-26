//
//  CircleButton.swift
//  Scribi
//
//  Created by nic on 19/10/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 30 {
        didSet {
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }

    
    
    func setupView(){
        layer.cornerRadius = cornerRadius
    }
}
