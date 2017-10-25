//
//  EmailRegistrationVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 25/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class EmailRegistrationVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rePasswordField: UITextField!
    
    @IBOutlet weak var registerButtonOutlet: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextfields()
        registerButtonOutlet.roundCorners()
    }

    func setupTextfields() {
        self.emailField.delegate = self
        self.passwordField.delegate = self
        self.rePasswordField.delegate = self
    }
    
    
    @IBAction func registerButtonAction(_ sender: Any) {
    }
    
    
    

}
