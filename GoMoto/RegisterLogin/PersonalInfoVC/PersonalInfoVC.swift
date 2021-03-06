//
//  PersonalInfoVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 30/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class PersonalInfoVC: UIViewController, PersonalInfoDelegate {
    

    
    @IBOutlet weak var tableView: UITableView!
    
    var user: TraxUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        print("PersonalInfoVC viewDidLoad \(user.id)")
    }
    
    
    func personalInfoReady(with user: TraxUser) {
        if user.contactNumber.isValidPhone() {
            RegistrationPresenter.shared.showAditionalInfoVC(with: user, from: self)
            print("PersonalInfo \(user.id)")
        } else {
            UserAlert.showMessage(from: self, title: "Error", message: "Please enter a valid phone number!")
        }
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
