//
//  NibLoadableView.swift
//  TacoPOP
//
//  Created by nic on 19/10/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
