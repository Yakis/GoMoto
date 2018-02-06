//
//  PushNotificationsManager.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 23/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import OneSignal

class PushNotificationsManager {
    
    
    
    
    
    static func enablePushNotifications() {
        let current = UNUserNotificationCenter.current()
        switch sender.isOn {
        case true:
            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: { [weak self] (isOn) in
                DispatchQueue.main.async {
                    
                }
            })
        default:
            current.getNotificationSettings(completionHandler: { [weak self] (settings) in
                if settings.authorizationStatus == .notDetermined {
                    // Notification permission has not been asked yet, go for it!
                    OneSignal.promptForPushNotifications(userResponse: { [weak self] accepted in
                        DispatchQueue.main.async {
                            
                        }
                    })
                }
                
                if settings.authorizationStatus == .denied {
                    DispatchQueue.main.async {
                        // Notification permission was previously denied, go to settings & privacy to re-enable
                        UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: { [weak self] (isOn) in
                            DispatchQueue.main.async {
                                
                            }
                        })
                    }
                }
                if settings.authorizationStatus == .authorized {
                    // Notification permission was already granted
                    DispatchQueue.main.async {
                        
                    }
                }
            })
    }







}
