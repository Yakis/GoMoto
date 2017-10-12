//
//  RegisterOwnerVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 11/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit

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

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    @IBAction func facebookLogin(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        print("Logging In")
        facebookLogin.logIn(withReadPermissions: ["email"], from: self, handler:{(facebookResult, facebookError) -> Void in
            if facebookError != nil {
                print("Facebook login failed. Error \(String(describing: facebookError))")
            } else if (facebookResult?.isCancelled)! {
                print("Facebook login was cancelled.")
            } else {
                print("You’re inz ;)")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                Auth.auth().signIn(with: credential, completion: { (user, error) in
                    guard let name = user?.displayName else {return}
                    guard let mail = user?.email else {return}
                    self.emailTextField.text = mail
                    self.firstNameTextField.text = name
                    self.emailTextField.endEditing(true)
                })
            }
        })
    }
    
    
    
    @IBAction func registerButtonAction(_ sender: Any) {
        emailRegistration(email: self.emailTextField.text!, password: passwordTextField.text!) { token in
           print("Success! User with token: \(String(describing: token)) has been logged id.")
            let owner = Owner(id: nil, email: self.emailTextField.text!, first_name: self.firstNameTextField.text!, last_name: self.lastNameTextField.text!, contact_number: self.contactNumberTextField.text!, token: token, created_at: nil, updated_at: nil)
            RestAPIManager.shared.saveOwner(owner: owner, completionHandler: { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    let ownerInfoVC = OwnerInfoVC(nibName: "OwnerInfoVC", bundle: nil)
                    ownerInfoVC.owner = owner
                    self.present(ownerInfoVC, animated: true, completion: nil)
                }
            })
        }
    }
    
    
    
    func emailRegistration(email: String, password: String, completion: @escaping (String) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                guard let error = error else {return}
                print(error.localizedDescription)
                return
            }
            let token = user.uid
            completion(token)
        }
    }

    
    func signInWithEmail(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
        }
    }
    
    
}
