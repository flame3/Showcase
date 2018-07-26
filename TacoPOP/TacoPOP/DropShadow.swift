//
//  DropShadow.swift
//  TacoPOP
//
//  Created by nic on 18/10/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//

import UIKit

protocol DropShadow {}

extension DropShadow where Self: UIView {
    
    func addDropShadow() {
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
        
    }
    
}

