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
    
    var userInfo: [String: String]!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailButtonOutlet.roundCorners()
        facebookButtonOutlet.roundCorners()
        self.userTypeLabel.text = userInfo["userType"]!
        self.userLogoImageView.image = UIImage(named: userInfo["imageName"]!)
        
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
        FirebaseManager.facebookRegistration(viewController: self) { (token) in
            
        }
    }
    
    @IBAction func emailButtonAction(_ sender: Any) {
        let formRegistrationVC = FormRegistrationVC(nibName: "FormRegistrationVC", bundle: nil)
        self.present(formRegistrationVC, animated: true, completion: nil)
    }
    
    
    func saveRegisteredUserToBackend (uid: String) {
        print(uid)
        let user = User(id: nil, username: nil, email: nil, first_name: nil, last_name: nil, postcode: nil, contact_number: nil, user_type: "owner", avatar: nil, device_token: nil, firebase_uid: uid, created_at: nil, updated_at: nil)
        DispatchQueue.main.async {
        }
//        RestAPIManager.shared.saveUser(user: user, completionHandler: { [weak self] (error) in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//            DispatchQueue.main.async {
//            self?.showOwnerView(with: user)
//            }
//        })
    }
    
    
    
    func showOwnerRegistrationForm(with user: User) {
//            let ownerInfoVC = OwnerInfoVC(nibName: "OwnerInfoVC", bundle: nil)
//            ownerInfoVC.user = user
//            ownerInfoVC.user?.avatar = "Mata de avatar"
//            self.present(ownerInfoVC, animated: true, completion: nil)
    }
    
    
}
