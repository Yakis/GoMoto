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
    
    var handle: AuthStateDidChangeListenerHandle?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailButtonOutlet.roundCorners()
        facebookButtonOutlet.roundCorners()
        self.userTypeLabel.text = userType.rawValue
        self.userLogoImageView.image = UIImage(named: userType.rawValue)
        
        if let accessToken = AccessToken.current {
            print("User is already logged in until: \(accessToken.expirationDate)")
        } else {
            print("You need to press that f button :]")
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
        FirebaseManager.facebookRegistration(userType: userType.rawValue, viewController: self) { (user) in
            guard let user = user else {return}
            self.showRegistrationForm(with: user)
        }
    }
    
    
    @IBAction func emailButtonAction(_ sender: Any) {
        let formRegistrationVC = FormRegistrationVC(nibName: "FormRegistrationVC", bundle: nil)
        self.present(formRegistrationVC, animated: true, completion: nil)
    }
    
    
    
    func showRegistrationForm(with user: User) {
        let formRegistrationVC = FormRegistrationVC(nibName: "FormRegistrationVC", bundle: nil)
        formRegistrationVC.user = user
        self.present(formRegistrationVC, animated: true, completion: nil)
    }
    
    
}
