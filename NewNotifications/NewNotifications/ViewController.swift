//
//  ViewController.swift
//  NewNotifications
//
//  Created by nic on 20/10/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. Request permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {(granted, error) in
            
            if granted {
                print("notification access granted")
            } else {
                print(error?.localizedDescription)
            }
        })
    }
    
    @IBAction func notifyButtonTapped(sender: UIButton){
        scheduleNotification(inSeconds: 5, completion: { success in
            if success {
                print("Successfully scheduled notification")
            } else {
                print("Error printing notification")
            }
        })
        
    }
    
    func scheduleNotification(inSeconds: TimeInterval , completion: @escaping (_ Success: Bool) -> ()){
        let myImage = "s"
        guard let imageURL = Bundle.main.url(forResource: myImage, withExtension: "jpeg") else {
            completion(false)
            return
        }
        
        var attachment: UNNotificationAttachment
        attachment = try! UNNotificationAttachment(identifier: "myNotification", url: imageURL, options: .none)
        
        
        
        
        
        let notif = UNMutableNotificationContent()
        
        
        notif.attachments = [attachment]
        
        notif.categoryIdentifier = "myNotificaitonCategory"

        
        notif.title = "new notification"
        notif.subtitle = "These are great"
        notif.body = "The new notification options on ios 10 are pretty dandy."
        
        
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        let request = UNNotificationRequest(identifier: "MyNotification", content: notif, trigger: notifTrigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil{
                print(error)
                completion(false)
            }else {
                completion(true)
            }
            
            
        }
        
    }


}

