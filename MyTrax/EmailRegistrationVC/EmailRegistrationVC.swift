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
        registerForKeyboardShowHide()
        setupTextfields()
        registerButtonOutlet.roundCorners()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeNotificationForKeyboardShowHide()
    }
    

    func setupTextfields() {
        self.emailField.delegate = self
        self.passwordField.delegate = self
        self.rePasswordField.delegate = self
    }
    
    
    @IBAction func registerButtonAction(_ sender: Any) {
        guard let email = emailField.text else {return}
        guard let password = passwordField.text else {return}
        FirebaseManager.emailRegistration(email: email, password: password) { (uid) in
            print("User registered with uid: \(uid)")
        }
    }
    

}
