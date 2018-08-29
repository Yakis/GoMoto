//
//  Owner.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 11/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation
import Firebase


struct TraxUser: Codable {
    
    var id: String?
    var username: String
    var email: String
    var firstName: String
    var lastName: String
    var postcode: String
    var contactNumber: String
    var userType: String
    var avatar: String
    var deviceToken: String
    
    
    init(data: [String: Any]) {
        self.id = data["id"] as? String ?? ""
        self.username = data["username"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.firstName = data["firstName"] as? String ?? ""
        self.lastName = data["lastName"] as? String ?? ""
        self.postcode = data["postcode"] as? String ?? ""
        self.contactNumber = data["contactNumber"] as? String ?? ""
        self.userType = data["userType"] as? String ?? ""
        self.avatar = data["userType"] as? String ?? ""
        self.deviceToken = data["deviceToken"] as? String ?? ""
    }
    
    init(id: String?,
    username: String,
    email: String,
    firstName: String,
    lastName: String,
    postcode: String,
    contactNumber: String,
    userType: String,
    avatar: String,
    deviceToken: String) {
        self.id = id
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.postcode = postcode
        self.contactNumber = contactNumber
        self.userType = userType
        self.avatar = avatar
        self.deviceToken = deviceToken
    }
    
    
    static func save(user: TraxUser, completionHandler: @escaping (TraxUser?, Error?) -> Void) {
        let db = Firestore.firestore()
        guard let userId = user.id else {return}
        let usersCollectionRef = db.collection("users").document("\(userId)")
        do {
            let dict = try user.asDictionary()
            usersCollectionRef.setData(dict)
            completionHandler(user, nil)
            let userDefaults = UserDefaults.standard
            userDefaults.set(user.userType, forKey: "userType")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    static func getUser(for uid: String, completionHandler: @escaping (TraxUser?, Error?) -> Void) {
        let db = Firestore.firestore()
        let usersCollectionRef = db.collection("users").document(uid)
        usersCollectionRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let data = document.data() else {return}
                let user = TraxUser(data: data)
                completionHandler(user, nil)
                let userDefaults = UserDefaults.standard
                userDefaults.set(user.userType, forKey: "userType")
                userDefaults.set(user.id, forKey: "uid")
            } else {
                print(error?.localizedDescription ?? "Unknown error!")
            }
        }
    }
    
    
    
    
}


enum UserType: String {
    case owner = "owner"
    case biker = "rider"
}
