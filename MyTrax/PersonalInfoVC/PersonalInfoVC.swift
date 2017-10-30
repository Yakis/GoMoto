//
//  PersonalInfoVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 30/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class PersonalInfoVC: UIViewController, PersonalInfoDelegate {
    
    
    
    func personalInfoReady(with user: TraxUser) {
       print("\(user.first_name)\n\n\(user.last_name)\n\n\(user.email)\n\n\(user.user_type)\n\n\(user.contact_number)\n\n\(user.firebase_uid)")
    }
    

    
    @IBOutlet weak var tableView: UITableView!
    
    var user: TraxUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }


    
    
    
    
}
