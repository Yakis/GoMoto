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
    }
    
    
    @IBAction func facebookLogin(_ sender: Any) {
        FirebaseManager.facebookRegistration(viewController: self) { [weak self] (user) in
            guard let user = user else {return}
            let firstName = user.displayName?.splitName().first ?? ""
            let lastName = user.displayName?.splitName().last ?? ""
            let email = user.email ?? ""
            let traxUser = TraxUser(id: 0, username: "", email: email, first_name: firstName, last_name: lastName, postcode: "", contact_number: "", user_type: (self?.userType.rawValue)!, avatar: "", device_token: "", firebase_uid: user.uid, created_at: nil, updated_at: nil)
            RegistrationPresenter.shared.showPersonalInfoVC(with: traxUser, from: self)
        }
    }
    
    
    @IBAction func emailButtonAction(_ sender: Any) {
        let emailRegisterVC = EmailRegistrationVC(nibName: "EmailRegistrationVC", bundle: nil)
        emailRegisterVC.userType = userType.rawValue
        self.navigationController?.pushViewController(emailRegisterVC, animated: true)
        
    }
    
    
    
    
    
}
