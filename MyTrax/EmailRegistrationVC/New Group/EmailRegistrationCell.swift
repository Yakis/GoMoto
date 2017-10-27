//
//  EmailRegistrationCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 27/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class EmailRegistrationCell: UITableViewCell, NibLoadable, ReusableView {

    
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
        print("Mother fucker!")
    }
    
    
    
}
