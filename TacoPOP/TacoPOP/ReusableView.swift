//
//  reusableView.swift
//  TacoPOP
//
//  Created by nic on 19/10/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//
import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
