//
//  EmailRegistrationCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 27/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

protocol EmailRegistrationDelegate: class {
    func registerButtonPressed(email: String, password: String)
}

extension EmailRegistrationCell: NibLoadable, ReusableView {}

class EmailRegistrationCell: UITableViewCell {

    weak var registerDelegate: EmailRegistrationDelegate?
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    @IBOutlet weak var registerButtonOutlet: UIButton!
    
    override func awakeFromNib() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        rePasswordTextField.delegate = self
        registerButtonOutlet.roundCorners()
    }
    
    
    
    @IBAction func registerButtonAction(_ sender: Any) {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        self.registerDelegate?.registerButtonPressed(email: email, password: password)
    }
    
    
    
}
