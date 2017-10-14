//
//  OwnerInfoVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 11/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class OwnerInfoVC: UIViewController {

    
    @IBOutlet weak var ownerInfoLabel: UILabel!
    
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let user = user else {return}
        self.ownerInfoLabel.text = "Welcome, \(user.first_name) \(user.last_name)! 😀"
        
    }


}
