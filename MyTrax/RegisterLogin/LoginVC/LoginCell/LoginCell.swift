//
//  LoginCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 14/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

protocol LoginDelegate: class {
    func emailLogin(user: TraxUser?, error: Error?)
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
        print("Login Pressed")
        guard let email = emailField.text else {return}
        guard let password = passwordField.text else {return}
        FirebaseManager.signInWithEmail(email: email, password: password) { [weak self] (firebaseUser, error) in
            guard let firebaseUser = firebaseUser else {
                print(error?.localizedDescription)
                return
            }
            TraxUser.getUser(for: firebaseUser.uid, completionHandler: { [weak self] (traxUser, error) in
                self?.loginDelegate?.emailLogin(user: traxUser, error: error)
            })
        }
    }
    
    
    
    @IBAction func facebookButtonAction(_ sender: Any) {
        print("Facebook Login pressed")
        loginDelegate?.facebookLogin()
    }
    
    
    
    
    
}
