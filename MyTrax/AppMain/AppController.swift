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
        switch Auth.auth().currentUser {
        case nil:
            let welcomeViewController = WelcomeVC(nibName: WelcomeNibs.welcomeVC, bundle: nil)
            return welcomeViewController
        default:
            return self.createAndReturnTabBarController()
        }
    }
    
    
    class func createAndReturnTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let allTracksVC = AllTracksVC(nibName: "AllTracksVC", bundle: nil)
        let navAllTracks = UINavigationController(rootViewController: allTracksVC)
        navAllTracks.navigationBar.topItem?.title = "Tracks"
        allTracksVC.tabBarItem = UITabBarItem(title: "Tracks", image: #imageLiteral(resourceName: "trackListTabBar"), selectedImage: #imageLiteral(resourceName: "trackListTabBar"))
        
        let favoritesVC = UIViewController()
        let navFavorites = UINavigationController(rootViewController: favoritesVC)
        navFavorites.navigationBar.topItem?.title = "Favorite"
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorite", image: #imageLiteral(resourceName: "favoriteTabBarEmpty"), selectedImage: #imageLiteral(resourceName: "favoriteTabBarFull"))
        
        let riderProfileVC = RiderProfileVC(nibName: "RiderProfileVC", bundle: nil)
        let navRiderVC = UINavigationController(rootViewController: riderProfileVC)
        riderProfileVC.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "riderProfileTabBar"), selectedImage: #imageLiteral(resourceName: "riderProfileTabBar"))
        
        let notificationsVC = UIViewController()
        let navNotifications = UINavigationController(rootViewController: notificationsVC)
        notificationsVC.tabBarItem = UITabBarItem(title: "Notifications", image: #imageLiteral(resourceName: "notificationTabBar"), selectedImage: #imageLiteral(resourceName: "notificationTabBar"))
        
        let sellingVC = UIViewController()
        let navSelling = UINavigationController(rootViewController: sellingVC)
        sellingVC.view.backgroundColor = UIColor.mediumGray
        sellingVC.tabBarItem = UITabBarItem(title: "Selling", image: #imageLiteral(resourceName: "sellTabBar"), selectedImage: #imageLiteral(resourceName: "sellTabBar"))
        
        let viewControllers = [navAllTracks, navFavorites, navRiderVC, navNotifications, navSelling]
        tabBarController.viewControllers = viewControllers
        return tabBarController
    }
    
    
    
    class func setupFirebase() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    
}
