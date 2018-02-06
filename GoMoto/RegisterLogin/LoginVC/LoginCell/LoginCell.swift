//
//  LoginCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 14/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

protocol LoginDelegate: class {
    func emailLogin(email: String, password: String)
    func facebookLogin()
}

class LoginCell: UITableViewCell, ReusableView, NibLoadable {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var facebookButtonOutlet: UIButton!
    
    weak var loginDelegate: LoginDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loginButtonOutlet.roundCorners()
        facebookButtonOutlet.roundCorners()
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        guard let email = emailField.text else {return}
        guard let password = passwordField.text else {return}
        self.loginDelegate?.emailLogin(email: email, password: password)
    }
    
    
    
    @IBAction func facebookButtonAction(_ sender: Any) {
        loginDelegate?.facebookLogin()
    }
    
    
    
    
    
}
