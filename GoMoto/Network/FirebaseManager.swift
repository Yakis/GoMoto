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
    
    
    static func facebookRegistration(viewController: UIViewController, completion: @escaping (User?) -> ()) {
        let facebookLogin = LoginManager()
        facebookLogin.logIn(readPermissions: [.email, .publicProfile], viewController: viewController) { (result) in
            ActivityIndicatorManager.shared.showActivityIndicator(on: viewController.view, interactionEnabled: false)
            switch result {
            case .failed(let error):
                UserAlert.showMessage(from: viewController, title: "Error", message: error.localizedDescription)
            case .cancelled:
                UserAlert.showMessage(from: viewController, title: "Error", message: "Login canceled")
                ActivityIndicatorManager.shared.stopActivityIndicator()
            case .success(_, _, let accessToken):
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
                Auth.auth().signIn(with: credential, completion: { (user, error) in
                    guard let user = user else {
                        guard let error = error else {return}
                        UserAlert.showMessage(from: viewController, title: "Error", message: error.localizedDescription)
                        return
                    }
                    ActivityIndicatorManager.shared.stopActivityIndicator()
                    save(uid: user.uid)
                        completion(user)
                })
            }
        }
    }
    
    
    
    static func facebookSignIn(viewController: UIViewController, completion: @escaping (User?) -> ()) {
        let facebookLogin = LoginManager()
        facebookLogin.logIn(readPermissions: [.email, .publicProfile], viewController: viewController) { (result) in
            ActivityIndicatorManager.shared.showActivityIndicator(on: viewController.view, interactionEnabled: false)
            switch result {
            case .failed(let error):
                UserAlert.showMessage(from: viewController, title: "Error", message: error.localizedDescription)
            case .cancelled:
                UserAlert.showMessage(from: viewController, title: "Error", message: "User canceled login")
            case .success(_, _, let accessToken):
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
                Auth.auth().signIn(with: credential, completion: { (user, error) in
                    guard let user = user else {
                        guard let error = error else {return}
                        UserAlert.showMessage(from: viewController, title: "Error", message: error.localizedDescription)
                        return
                    }
                    ActivityIndicatorManager.shared.stopActivityIndicator()
                    save(uid: user.uid)
                    completion(user)
                })
            }
        }
    }
    
    
    static func emailRegistration(userType: String, email: String, password: String, viewController: UIViewController, completion: @escaping (TraxUser) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                guard let error = error else {return}
                UserAlert.showMessage(from: viewController, title: "Error", message: error.localizedDescription)
                return
            }
            guard let email = user.email else {return}
            let traxUser = TraxUser(id: 0, username: "", email: email, first_name: "", last_name: "", postcode: "", contact_number: "", user_type: userType, avatar: "", device_token: "", firebase_uid: user.uid, created_at: nil, updated_at: nil)
            save(uid: user.uid)
            completion(traxUser)
        }
    }
    
    
    static func signInWithEmail(email: String, password: String, completion: @escaping (User?, Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let user = user {
                save(uid: user.uid)
                completion(user, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    
   fileprivate static func save(uid string: String?) {
    guard let uid = string else {return}
    print(uid)
        UserDefaults.standard.setValue(uid, forKey: "uid")
    }
    
    
    
}
