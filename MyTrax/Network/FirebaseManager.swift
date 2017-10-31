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


class FirebaseManager {
    
    
    var firebaseUser: User!
    
    static func facebookRegistration(userType: String, viewController: UIViewController, completion: @escaping (TraxUser?) -> ()) {
        let facebookLogin = LoginManager()
        facebookLogin.logIn(readPermissions: [.email, .publicProfile], viewController: viewController) { (result) in
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
                    let traxUser = TraxUser(id: nil, username: nil, email: user.email, first_name: user.displayName?.splitName().first, last_name: user.displayName?.splitName().last, postcode: nil, contact_number: nil, user_type: userType, avatar: nil, device_token: nil, firebase_uid: user.uid, created_at: nil, updated_at: nil)
                        completion(traxUser)
                })
            }
        }
    }
    
    
    static func saveAccessToken(for user: User) {
        user.getIDTokenForcingRefresh(true, completion: { (tokenString, error) in
             guard let tokenString = tokenString else {return}
            print(tokenString)
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
            let traxUser = TraxUser(id: nil, username: nil, email: user.email, first_name: nil, last_name: nil, postcode: nil, contact_number: nil, user_type: userType, avatar: nil, device_token: nil, firebase_uid: user.uid, created_at: nil, updated_at: nil)
            completion(traxUser)
        }
    }
    
    
    static func signInWithEmail(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
        }
    }
}