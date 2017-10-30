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
       RegistrationPresenter.shared.showAditionalInfoVC(with: user, from: self)
    }
    

    
    @IBOutlet weak var tableView: UITableView!
    
    var user: TraxUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }


    
    
    
    
}
