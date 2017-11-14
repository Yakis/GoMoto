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
        
    }
    
    func facebookLogin() {
        FirebaseManager.facebookLogin(userType: userType.rawValue, viewController: self) { [weak self] (user) in
            guard let uid = user?.firebase_uid else {return}
            TraxUser.getUser(for: uid, completionHandler: { [weak self] (user, error) in
                guard let user = user else {
                    guard let error = error else {return}
                    UserAlert.showMessage(from: self, title: "Error", message: error.localizedDescription)
                    return
                }
                DispatchQueue.main.async {
                    self?.showVCForUser(user: user)
                }
                
            })
        }
    }
    
    
    
    func showVCForUser(user: TraxUser) {
        switch userType.rawValue {
        case "owner":
            let adminVC = AdminVC(nibName: "AdminVC", bundle: nil)
            adminVC.user = user
            self.present(adminVC, animated: true, completion: nil)
         // Must build OwnerVC
        default:
            RegistrationPresenter.shared.showDashboardVC(with: user, from: self)
        }
    }
    
    

}
