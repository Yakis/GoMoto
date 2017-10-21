//
//  AppController.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 09/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import Firebase

class AppController: NSObject {
    
    class func launchDashboardIn(window: UIWindow) {
        window.rootViewController = self.createAndReturnRoot()
        window.makeKeyAndVisible()
    }
    
    class func createAndReturnRoot() -> UIViewController {
        //let dashboardViewController = DashboardVC(nibName: DashboardNibs.dashboardVC, bundle: nil)
        let welcomeViewController = WelcomeVC(nibName: WelcomeNibs.welcomeVC, bundle: nil)
       // let navigationController = UINavigationController(rootViewController: welcomeViewController)
        return welcomeViewController
    }
    
    class func setupFirebase() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    
}
