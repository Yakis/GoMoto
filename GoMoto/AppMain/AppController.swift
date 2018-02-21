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
        let welcomeViewController = WelcomeVC(nibName: WelcomeNibs.welcomeVC, bundle: nil)
        let navController = UINavigationController(rootViewController: welcomeViewController)
        navController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navController.navigationBar.shadowImage = UIImage()
        let uid = UserDefaults.standard.value(forKey: "uid")
        switch uid {
        case nil:
            return navController
        default:
            guard let userType = UserDefaults.standard.value(forKey: "userType") as? String else {return navController}
            print(userType)
            switch userType {
            case "owner":
                return AppController.createAndReturnOwnerTabBarController()
            default:
                return AppController.createAndReturnRiderTabBarController()
            }
        }
    }
    
    
     class func createAndReturnRiderTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
//        let allTracksVC = AllTracksVC(nibName: "AllTracksVC", bundle: nil)
//        let navAllTracks = UINavigationController(rootViewController: allTracksVC)
//        navAllTracks.navigationBar.topItem?.title = "Tracks"
//        allTracksVC.tabBarItem = UITabBarItem(title: "Tracks", image: #imageLiteral(resourceName: "trackListTabBar"), selectedImage: #imageLiteral(resourceName: "trackListTabBar"))
        
        let postsFeedVC = PostsFeedVC(nibName: "PostsFeedVC", bundle: nil)
        let navPostsFeed = UINavigationController(rootViewController: postsFeedVC)
        navPostsFeed.navigationBar.topItem?.title = "Posts"
        postsFeedVC.tabBarItem = UITabBarItem(title: "Posts", image: #imageLiteral(resourceName: "trackListTabBar"), selectedImage: #imageLiteral(resourceName: "trackListTabBar"))
        
        let myTracks = MyTracksVC(nibName: "MyTracksVC", bundle: nil)
        let navMyTracks = UINavigationController(rootViewController: myTracks)
        navMyTracks.navigationBar.topItem?.title = "My Tracks"
        myTracks.tabBarItem = UITabBarItem(title: "My Tracks", image: #imageLiteral(resourceName: "favoriteTabBarFull"), selectedImage: #imageLiteral(resourceName: "favoriteTabBarFull"))
        
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
        
        let viewControllers = [navPostsFeed, navMyTracks, navRiderVC, navNotifications, navSelling]
        tabBarController.viewControllers = viewControllers
        return tabBarController
    }
    
    
    
     class func createAndReturnOwnerTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()

        
        let ownerTracksVC = OwnerTracksVC(nibName: "OwnerTracksVC", bundle: nil)
        let navOwnerTracks = UINavigationController(rootViewController: ownerTracksVC)
        navOwnerTracks.navigationBar.topItem?.title = "Tracks"
        ownerTracksVC.tabBarItem = UITabBarItem(title: "Tracks", image: #imageLiteral(resourceName: "trackListTabBar"), selectedImage: #imageLiteral(resourceName: "trackListTabBar"))
        
        let favoritesVC = UIViewController()
        let navFavorites = UINavigationController(rootViewController: favoritesVC)
        navFavorites.navigationBar.topItem?.title = "My Tracks"
        favoritesVC.tabBarItem = UITabBarItem(title: "My Tracks", image: #imageLiteral(resourceName: "favoriteTabBarFull"), selectedImage: #imageLiteral(resourceName: "favoriteTabBarFull"))

        let riderProfileVC = RiderProfileVC(nibName: "RiderProfileVC", bundle: nil)
        let navRiderVC = UINavigationController(rootViewController: riderProfileVC)
        navRiderVC.navigationBar.topItem?.title = "Owner Profile"
        riderProfileVC.tabBarItem = UITabBarItem(title: "Owner Profile", image: #imageLiteral(resourceName: "riderProfileTabBar"), selectedImage: #imageLiteral(resourceName: "riderProfileTabBar"))

        let notificationsVC = UIViewController()
        let navNotifications = UINavigationController(rootViewController: notificationsVC)
        notificationsVC.tabBarItem = UITabBarItem(title: "Notifications", image: #imageLiteral(resourceName: "notificationTabBar"), selectedImage: #imageLiteral(resourceName: "notificationTabBar"))

        let sellingVC = UIViewController()
        let navSelling = UINavigationController(rootViewController: sellingVC)
        sellingVC.view.backgroundColor = UIColor.mediumGray
        sellingVC.tabBarItem = UITabBarItem(title: "Selling", image: #imageLiteral(resourceName: "sellTabBar"), selectedImage: #imageLiteral(resourceName: "sellTabBar"))

        let viewControllers = [navOwnerTracks, navFavorites, navRiderVC, navNotifications, navSelling]
        tabBarController.viewControllers = viewControllers
        return tabBarController
    }
    
    
    
    class func setupFirebase() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    
}
