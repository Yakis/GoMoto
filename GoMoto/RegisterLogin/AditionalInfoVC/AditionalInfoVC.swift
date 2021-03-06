//
//  AditionalInfoVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 30/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import Firebase

class AditionalInfoVC: UIViewController, UsernameDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    var user: TraxUser!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableVIew()
    }

    
    
    
    
    func saveUser(with username: String) {
        print("AditionalInfo \(user.id)")
        user.username = username
        TraxUser.save(user: user) { [weak self] (savedUser, error)  in
            guard let savedUser = savedUser else {return}
            DispatchQueue.main.async {
                switch savedUser.userType {
                case "owner":
                    RegistrationPresenter.shared.showAddTracksVC(with: savedUser, from: self)
                default:
                    RegistrationPresenter.shared.showRiderDashboardVC(from: self)
                }
            }
            guard let error = error else {return}
            UserAlert.showMessage(from: self, title: "Error", message: error.localizedDescription)
        }
    }
    
    

}
