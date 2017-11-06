//
//  FirebaseManager.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 21/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation
import FirebaseAuth
import FacebookCore
import FacebookLogin
import Firebase


class FirebaseManager {
    
    
    var firebaseUser: User!
    
    
    static func facebookRegistration(userType: String, viewController: UIViewController, completion: @escaping (TraxUser?) -> ()) {
        let facebookLogin = LoginManager()
        facebookLogin.logIn(readPermissions: [.email, .publicProfile], viewController: viewController) { (result) in
            ActivityIndicatorManager.shared.showActivityIndicator(on: viewController.view, interactionEnabled: false)
            switch result {
            case .failed(let error):
                UserAlert.showMessage(from: viewController, title: "Error", message: error.localizedDescription)
            case .cancelled:
                UserAlert.showMessage(from: viewController, title: "Error", message: "User cancelled login")
            case .success(_, _, let accessToken):
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
                Auth.auth().signIn(with: credential, completion: { (user, error) in
                    guard let user = user else {
                        guard let error = error else {return}
                        UserAlert.showMessage(from: viewController, title: "Error", message: error.localizedDescription)
                        return
                    }
                       self.saveAccessToken(for: user)
                    let firstName = user.displayName?.splitName().first ?? ""
                    let lastName = user.displayName?.splitName().last ?? ""
                    let email = user.email ?? ""
                    let traxUser = TraxUser(id: 0, username: "", email: email, first_name: firstName, last_name: lastName, postcode: "", contact_number: "", user_type: userType, avatar: "", device_token: "", firebase_uid: user.uid, created_at: nil, updated_at: nil)
                    ActivityIndicatorManager.shared.stopActivityIndicator()
                        completion(traxUser)
                })
            }
        }
    }
    
    
    static func saveAccessToken(for user: User) {
        user.getIDTokenForcingRefresh(true, completion: { (tokenString, error) in
             guard let tokenString = tokenString else {return}
            let userDefaults = UserDefaults.standard
            userDefaults.set(tokenString, forKey: "accessToken")
        })
    }
    
    
    static func emailRegistration(userType: String, email: String, password: String, viewController: UIViewController, completion: @escaping (TraxUser) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                guard let error = error else {return}
                UserAlert.showMessage(from: viewController, title: "Error", message: error.localizedDescription)
                return
            }
            self.saveAccessToken(for: user)
            
            user.getIDTokenForcingRefresh(true, completion: { (tokenString, error) in
                guard let tokenString = tokenString else {return}
                print(tokenString)
            })
            guard let email = user.email else {return}
            let traxUser = TraxUser(id: 0, username: "", email: email, first_name: "", last_name: "", postcode: "", contact_number: "", user_type: userType, avatar: "", device_token: "", firebase_uid: user.uid, created_at: nil, updated_at: nil)
            completion(traxUser)
        }
    }
    
    
    static func signInWithEmail(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
        }
    }
    
    
    
}
