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
    
    
    var owner: Owner?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let owner = owner else {return}
        self.ownerInfoLabel.text = "Welcome, \(owner.first_name) \(owner.last_name)! 😀"
        
    }


}
