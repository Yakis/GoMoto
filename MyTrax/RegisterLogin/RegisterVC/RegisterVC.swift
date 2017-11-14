//
//  RegisterOwnerVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 11/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import FirebaseAuth
import FacebookCore
import FacebookLogin

class RegisterVC: UIViewController {
    
    
    @IBOutlet weak var emailButtonOutlet: UIButton!
    
    @IBOutlet weak var facebookButtonOutlet: UIButton!
    
    @IBOutlet weak var signInButtonOutlet: UIButton!
    
    @IBOutlet weak var userLogoImageView: UIImageView!
    
    
    @IBOutlet weak var userTypeLabel: UILabel!
    
    var userType: UserType!
    var activityIndicator: UIActivityIndicatorView!
    var handle: AuthStateDidChangeListenerHandle?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailButtonOutlet.roundCorners()
        facebookButtonOutlet.roundCorners()
        self.userTypeLabel.text = userType.rawValue
        self.userLogoImageView.image = UIImage(named: userType.rawValue)
        
        if let accessToken = AccessToken.current {
            UserAlert.showMessage(from: self, title: "Info", message: "User is already logged in until: \(accessToken.expirationDate)")
        } else {
            
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    
    @IBAction func facebookLogin(_ sender: Any) {
        FirebaseManager.facebookLogin(userType: userType.rawValue, viewController: self) { [weak self] (user) in
            guard let user = user else {return}
            RegistrationPresenter.shared.showPersonalInfoVC(with: user, from: self!)
        }
    }
    
    
    @IBAction func emailButtonAction(_ sender: Any) {
        let emailRegisterVC = EmailRegistrationVC(nibName: "EmailRegistrationVC", bundle: nil)
        emailRegisterVC.userType = userType.rawValue
        self.present(emailRegisterVC, animated: true, completion: nil)
        
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        let loginVC = LoginVC(nibName: "LoginVC", bundle: nil)
        loginVC.userType = self.userType
        self.present(loginVC, animated: true, completion: nil)
    }
    
    
    
}
