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
    var username: String = ""
    var email: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var postcode: String = ""
    var contactNumber: String = ""
    var userType: String = ""
    var avatar: String = ""
    var deviceToken: String = ""
//    var createdAt: Date?
//    var updatedAt: Date?
    
    
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
//
//        let usersEndpoint = "\(Endpoints.Users.baseUrl)\(Endpoints.createNew)"
//        guard let usersUrl = URL(string: usersEndpoint) else {return}
//        print(usersUrl)
//        var request = URLRequest(url: usersUrl)
//        request.httpMethod = HTTPMethods.POST.rawValue
//        request.setValue(HTTPContentType.JSON.rawValue, forHTTPHeaderField: HTTPHeaderField.ContentType.rawValue)
//        let encoder = JSONEncoder()
//        do {
//            let newUserAsJSON = try encoder.encode(user)
//            request.httpBody = newUserAsJSON
//        } catch {
//            print(error.localizedDescription)
//            completionHandler(nil, error)
//        }
//        let session = URLSession.shared
//        let task = session.dataTask(with: request, completionHandler: {
//            (data, response, error) in
//            let decoder = JSONDecoder()
//            do {
//                guard let data = data else {return}
//                let newUser = try decoder.decode(TraxUser.self, from: data)
//                completionHandler(newUser, nil)
//                let userDefaults = UserDefaults.standard
//                userDefaults.set(newUser.userType, forKey: "userType")
//                print(newUser.firstName)
//            } catch {
//
//            }
//        })
//        task.resume()
    }
    
    
    
    
    
//    var id: String?
//    var username: String = ""
//    var email: String = ""
//    var firstName: String = ""
//    var lastName: String = ""
//    var postcode: String = ""
//    var contactNumber: String = ""
//    var userType: String = ""
//    var avatar: String = ""
//    var deviceToken: String = ""
    
    static func getUser(for uid: String, completionHandler: @escaping (TraxUser?, Error?) -> Void) {
        let db = Firestore.firestore()
        let usersCollectionRef = db.collection("users").document(uid)
        usersCollectionRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let id = document.documentID as? String else {return}
                guard let username = document.get("username") as? String else {return}
                guard let email = document.get("email") as? String else {return}
                guard let firstName = document.get("firstName") as? String else {return}
                guard let lastName = document.get("lastName") as? String else {return}
                guard let postcode = document.get("postcode") as? String else {return}
                guard let contactNumber = document.get("contactNumber") as? String else {return}
                guard let userType = document.get("userType") as? String else {return}
                guard let avatar = document.get("userType") as? String else {return}
                guard let deviceToken = document.get("deviceToken") as? String else {return}
                let user = TraxUser(id: id, username: username, email: email, firstName: firstName, lastName: lastName, postcode: postcode, contactNumber: contactNumber, userType: userType, avatar: avatar, deviceToken: deviceToken)
                completionHandler(user, nil)
                let userDefaults = UserDefaults.standard
                userDefaults.set(user.userType, forKey: "userType")
                userDefaults.set(user.id, forKey: "uid")
                print("Get User method: \(user)")
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    
    
    
}


enum UserType: String {
    case owner = "owner"
    case biker = "rider"
}
