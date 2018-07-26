//
//  EventMoniter.swift
//  play
//
//  Created by nic on 15/11/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//

import Cocoa

class EventMoniter {
    private var moniter: AnyObject?
    private var mask: NSEventMask?
    private var handler: (NSEvent?) -> ()
    init(mask: NSEventMask, handler: @escaping (NSEvent?) -> ()) {
        self.mask = mask
        self.handler = handler
    }
    deinit {
        stop()
    }
    func start(){
        moniter = NSEvent.addGlobalMonitorForEvents(matching: mask!, handler: handler) as AnyObject?
    }
    func stop(){
        if moniter != nil {
            NSEvent.removeMonitor(moniter)
            moniter = nil
        }
    }
}
