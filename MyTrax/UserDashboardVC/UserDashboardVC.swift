//
//  UserDashboardVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 05/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class UserDashboardVC: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var user: TraxUser?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = user else {return}
        let firstName = user.first_name
        self.welcomeLabel.text = "Welcome, \(firstName)"
    }

    

}
