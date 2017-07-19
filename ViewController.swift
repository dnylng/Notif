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

}

