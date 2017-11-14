//
//  LoginVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 13/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, LoginDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var userType: UserType!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    
    func emailLogin(user: TraxUser?, error: Error?) {
        guard let traxUser = user else {return}
        DispatchQueue.main.async {
            self.showVCForUser(user: traxUser)
        }
    }
    
    func facebookLogin() {
        FirebaseManager.facebookLogin(userType: userType.rawValue, viewController: self) { [weak self] (user) in
            guard let uid = user?.firebase_uid else {return}
            TraxUser.getUser(for: uid, completionHandler: { [weak self] (traxUser, error) in
                guard let traxUser = traxUser else {
                    UserAlert.showMessage(from: self, title: "Error", message: error!.localizedDescription)
                    return
                }
                DispatchQueue.main.async {
                    self?.showVCForUser(user: traxUser)
                }
                
            })
        }
    }
    
    
    
    func showVCForUser(user: TraxUser) {
        switch user.user_type {
        case "owner":
            let ownerDashboard = AppController.createAndReturnOwnerTabBarController()
            self.present(ownerDashboard, animated: true, completion: nil)
        default:
            RegistrationPresenter.shared.showDashboardVC(with: user, from: self)
        }
    }
    
    

}
