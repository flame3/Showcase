//
//  AppDelegate.swift
//  play
//
//  Created by nic on 15/11/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    let popover = NSPopover()
    var eventMoniter: EventMoniter?
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button{
            button.image = NSImage(named: "play_btn")
            button.action = #selector(AppDelegate.playMusic)
            
            
        }
        
        popover.contentViewController = PlayVC.loadFromNib()
        eventMoniter = EventMoniter(mask: [.leftMouseUp, .rightMouseUp], handler: { (event) -> () in
            if self.popover.isShown{
               self.closePopover(sender: event)
            }
        })
    }
    func showPopover(sender: AnyObject?){
        if let button = statusItem.button{
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
        eventMoniter?.start()

        
    }
    func closePopover(sender: AnyObject?){
        popover.performClose(sender)
        eventMoniter?.stop()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    func playMusic(sender: NSStatusBarButton) {
        if popover.isShown{
            closePopover(sender: sender)
        }else{
            showPopover(sender: sender)
        }
    }
    func quit(sender: NSStatusBarButton){
        print("Time to go")
    }


}

