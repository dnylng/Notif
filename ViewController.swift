//
//  ViewController.swift
//  Notif
//
//  Created by Danny Luong on 7/19/17.
//  Copyright © 2017 dnylng. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Request user permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { (granted, error) in
            
            if granted {
                print("Notification access granted")
            } else {
                print("error?.localizedDescription")
            }
        })
    }

    @IBAction func notifyBtnPressed(_ sender: Any) {
        scheduleNotif(inSeconds: 5, completion: { success in
            if success {
                print("Successfully scheduled notification")
            } else {
                print("Error in scheduling notification")
            }
        })
    }
    
    func scheduleNotif(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        
        let notif = UNMutableNotificationContent()
        
        notif.title = "New Notification"
        notif.subtitle = "These will keep you up to date!"
        notif.body = "Check out all of our new amazing updates to the app. Please continue to read our notifications."
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print(error!)
                completion(false)
            } else {
                completion(true)
            }
        })
    }
    
}

