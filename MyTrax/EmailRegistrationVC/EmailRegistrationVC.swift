//
//  EmailRegistrationVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 25/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class EmailRegistrationVC: UIViewController, EmailRegistrationDelegate {
    
    
    
    func registerButtonPressed(email: String, password: String) {
        FirebaseManager.emailRegistration(email: email, password: password) { (token) in
            print("Registered by Yakis with: \(token)")
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    
    func setupTableView () {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EmailRegistrationCell.self)
        tableView.register(LogoCell.self)
    }
    

}
