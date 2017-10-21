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

class RegisterOwnerVC: UIViewController {
    

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var contactNumberTextField: UITextField!
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var retypePasswordTextField: UITextField!
        
    var handle: AuthStateDidChangeListenerHandle?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let facebookLogin = LoginManager()
        facebookLogin.logIn(readPermissions: [.email, .publicProfile], viewController: self) { (result) in
            switch result {
            case .failed(let error):
                print(error.localizedDescription)
            case .cancelled:
                print("User cancelled login")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
                Auth.auth().signIn(with: credential, completion: { (user, error) in
                    user?.getIDTokenForcingRefresh(true, completion: { (tokenString, error) in
                        print(tokenString!)
                    })
                    guard let fullName = user?.displayName else {return}
                    let array = fullName.components(separatedBy: " ")
                    let firstName = array[0]
                    let lastName = array[1]
                    self.firstNameTextField.text = firstName
                    self.lastNameTextField.text = lastName
                    guard let mail = user?.email else {return}
                    self.emailTextField.text = mail
                    guard let phone = user?.phoneNumber else {return}
                    print(phone)
                    self.contactNumberTextField.text = phone
                })
            }
        }
    }
    
    
    
    @IBAction func registerButtonAction(_ sender: Any) {
        FirebaseManager.emailRegistration(email: self.emailTextField.text!, password: passwordTextField.text!) { [weak self] uid in
            self?.saveRegisteredUserToBackend(uid: uid)
        }
    }
    
    
    func saveRegisteredUserToBackend (uid: String) {
        let user = User(id: nil, username: "", email: self.emailTextField.text!, first_name: self.firstNameTextField.text!, last_name: self.lastNameTextField.text!, postcode: "AL10 8HD", contact_number: self.contactNumberTextField.text!, user_type: "owner", avatar: "https://google.com/iamges", device_token: "h809sbd8dbsj", firebase_uid: uid, created_at: nil, updated_at: nil)
        RestAPIManager.shared.saveUser(user: user, completionHandler: { [weak self] (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
            self?.showOwnerView(with: user)
            }
        })
    }
    
    
    
    func showOwnerView(with user: User) {
            let ownerInfoVC = OwnerInfoVC(nibName: "OwnerInfoVC", bundle: nil)
            ownerInfoVC.user = user
            self.present(ownerInfoVC, animated: true, completion: nil)
    }
    
    
}
