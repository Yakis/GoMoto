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
    
   // var userType: UserType!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    
    func emailLogin(email: String, password: String) {
        FirebaseManager.signInWithEmail(email: email, password: password) { [weak self] (firebaseUser, error) in
            guard let firebaseUser = firebaseUser else {
                UserAlert.showMessage(from: self, title: "Error", message: (error?.localizedDescription)!)
                return
            }
            TraxUser.getUser(for: firebaseUser.uid, completionHandler: { [weak self] (traxUser, error) in
                        guard let traxUser = traxUser else {return}
                        DispatchQueue.main.async {
                            UserDefaults.standard.set(traxUser.id, forKey: "userId")
                            self?.showVCForUser(user: traxUser)
                        }
            })
        }

    }
    
    func facebookLogin() {
        FirebaseManager.facebookSignIn(viewController: self) { [weak self] (user) in
            guard let uid = user?.uid else {return}
            TraxUser.getUser(for: uid, completionHandler: { [weak self] (traxUser, error) in
                guard let traxUser = traxUser else {
                    UserAlert.showMessage(from: self, title: "Error", message: error!.localizedDescription)
                    return
                }
                DispatchQueue.main.async {
                    UserDefaults.standard.set(traxUser.id, forKey: "userId")
                    self?.showVCForUser(user: traxUser)
                }
            })
        }
    }
    
    
    
    func showVCForUser(user: TraxUser) {
        switch user.userType {
        case "owner":
            let ownerDashboard = AppController.createAndReturnOwnerTabBarController()
            self.present(ownerDashboard, animated: true, completion: nil)
        default:
            let riderDashboard = AppController.createAndReturnRiderTabBarController()
            self.present(riderDashboard, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func cancelLogoinButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
