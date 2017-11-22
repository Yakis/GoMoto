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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isUserInteractionEnabled = false
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.hidesBackButton = false
        navigationController?.navigationBar.isUserInteractionEnabled = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    
}
