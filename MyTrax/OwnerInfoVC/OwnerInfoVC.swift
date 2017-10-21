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
        let firstName = user.first_name ?? "Nicu"
        let lastName = user.last_name ?? "Holder"
        self.ownerInfoLabel.text = "Welcome, \(firstName)) \(lastName)! 😀\(user.avatar)"
        
    }


}
