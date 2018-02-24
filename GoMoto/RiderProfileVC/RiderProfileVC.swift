//
//  RiderProfileVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 08/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import Firebase
import OneSignal

class RiderProfileVC: UIViewController {

    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logoutButtonOutlet: UIButton!
    @IBOutlet weak var notificationsEnabledSwitch: UISwitch!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButtonOutlet.roundCorners()
        setupNameLabel()
    }

    
    func setupNameLabel() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        TraxUser.getUser(for: uid) { [weak self] (user, error) in
            guard let firstName = user?.first_name else {return}
            guard let lastName = user?.last_name else {return}
            DispatchQueue.main.async {
                guard let user = user else {return}
                UserDefaults.standard.set(user.id, forKey: "user_id")
                self?.welcomeLabel.text = "Welcome, \(firstName) \(lastName)"
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    @IBAction func enableNotificationsAction(_ sender: UISwitch) {
//        let current = UNUserNotificationCenter.current()
//        switch sender.isOn {
//        case true:
//            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: { [weak self] (isOn) in
//                DispatchQueue.main.async {
//                    self?.notificationsEnabledSwitch.setOn(isOn, animated: true)
//                }
//            })
//        default:
//            current.getNotificationSettings(completionHandler: { [weak self] (settings) in
//                if settings.authorizationStatus == .notDetermined {
//                    // Notification permission has not been asked yet, go for it!
//                    OneSignal.promptForPushNotifications(userResponse: { [weak self] accepted in
//                        DispatchQueue.main.async {
//                            self?.notificationsEnabledSwitch.setOn(accepted, animated: true)
//                        }
//                    })
//                }
//
//                if settings.authorizationStatus == .denied {
//                    DispatchQueue.main.async {
//                        // Notification permission was previously denied, go to settings & privacy to re-enable
//                        UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: { [weak self] (isOn) in
//                            DispatchQueue.main.async {
//                                self?.notificationsEnabledSwitch.setOn(isOn, animated: true)
//                            }
//                        })
//                    }
//                }
//                if settings.authorizationStatus == .authorized {
//                    // Notification permission was already granted
//                    DispatchQueue.main.async {
//                        self?.notificationsEnabledSwitch.setOn(true, animated: true)
//                    }
//                }
//            })
//        }
        
        
        
        
    }
    
    
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        do {
       try Auth.auth().signOut()
            let userDefaults = UserDefaults.standard
            userDefaults.removeObject(forKey: "userType")
            userDefaults.removeObject(forKey: "uid")
        self.present(AppController.createAndReturnRoot(), animated: true, completion: nil)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    

}
