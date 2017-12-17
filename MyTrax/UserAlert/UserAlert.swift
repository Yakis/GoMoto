//
//  UserAlert.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 31/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import OneSignal

class UserAlert {
    
    static func showMessage(from viewController: UIViewController?, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            
        }
        alert.addAction(action)
        guard let viewController = viewController else {return}
        viewController.present(alert, animated: true)
    }
    
    
    
    static func askUserToAcceptPushNotifications() {
        let current = UNUserNotificationCenter.current()
        current.getNotificationSettings(completionHandler: {(settings) in
            if settings.authorizationStatus == .notDetermined {
                // Notification permission has not been asked yet, go for it!
                OneSignal.promptForPushNotifications(userResponse: {accepted in
                    print("Push notifcations accepted = \(accepted)")
                })
            }
            
            if settings.authorizationStatus == .denied {
                DispatchQueue.main.async {
                    // Notification permission was previously denied, go to settings & privacy to re-enable
                    UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: {(isOn) in
                        print("Push notifcations accepted = \(isOn)")
                    })
                }
            }
            if settings.authorizationStatus == .authorized {
                // Notification permission was already granted
                print("Push notifcations accepted = ALREADY GRANTED")
            }
        })
    }
    
    
    
    
}
