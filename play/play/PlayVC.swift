//
//  PlayVC.swift
//  play
//
//  Created by nic on 15/11/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//

import Cocoa

class PlayVC: NSViewController {

    class func loadFromNib() -> PlayVC {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: "PlayVC") as! PlayVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
