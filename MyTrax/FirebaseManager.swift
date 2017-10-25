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
    
    
    static func facebookRegistration(viewController: UIViewController, completion: @escaping (String) -> ()) {
        let facebookLogin = LoginManager()
        facebookLogin.logIn(readPermissions: [.email, .publicProfile], viewController: viewController) { (result) in
            switch result {
            case .failed(let error):
                print(error.localizedDescription)
            case .cancelled:
                print("User cancelled login")
            case .success(_, _, let accessToken):
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
                Auth.auth().signIn(with: credential, completion: { (user, error) in
                    user?.getIDTokenForcingRefresh(true, completion: { (tokenString, error) in
                        guard let tokenString = tokenString else {return}
                        completion(tokenString)
                    })
                })
            }
        }
    }
    
    
    static func emailRegistration(email: String, password: String, completion: @escaping (String) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                guard let error = error else {return}
                print(error.localizedDescription)
                return
            }
            user.getIDTokenForcingRefresh(true, completion: { (tokenString, error) in
                guard let tokenString = tokenString else {return}
                print(tokenString)
            })
            let token = user.uid
            completion(token)
        }
    }
    
    
    static func signInWithEmail(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
        }
    }
}
