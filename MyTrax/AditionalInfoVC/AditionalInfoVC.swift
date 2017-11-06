//
//  AditionalInfoVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 30/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit


class AditionalInfoVC: UIViewController, UsernameDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    var user: TraxUser!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableVIew()
    }

    
    
    
    
    func saveUser(with username: String) {
        user.username = username
        RestAPIManager.shared.saveUser(user: user) { (savedUser, error)  in
            guard let savedUser = savedUser else {return}
            DispatchQueue.main.async {
                switch savedUser.user_type {
                case "owner":
                    let addTracksVC = AddTracksVC(nibName: "AddTracksVC", bundle: nil)
                    addTracksVC.user = savedUser
                    self.present(addTracksVC, animated: true, completion: nil)
                default:
                    let userDashboardVC = UserDashboardVC(nibName: "UserDashboardVC", bundle: nil)
                    userDashboardVC.user = savedUser
                    self.present(userDashboardVC, animated: true, completion: nil)
                }
            }
            guard let error = error else {return}
            UserAlert.showMessage(from: self, title: "Error", message: error.localizedDescription)
        }
    }
    
    

}
