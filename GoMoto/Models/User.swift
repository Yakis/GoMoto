//
//  Owner.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 11/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation

struct TraxUser: Codable {
    
    var id: Int?
    var username: String = ""
    var email: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var postcode: String = ""
    var contactNumber: String = ""
    var userType: String = ""
    var avatar: String = ""
    var deviceToken: String = ""
    var firebaseUid: String = ""
//    var createdAt: Date?
//    var updatedAt: Date?
    
    
    static func save(user: TraxUser, completionHandler: @escaping (TraxUser?, Error?) -> Void) {
        print(user)
        let usersEndpoint = "\(Endpoints.Users.baseUrl)\(Endpoints.createNew)"
        guard let usersUrl = URL(string: usersEndpoint) else {return}
        print(usersUrl)
        var request = URLRequest(url: usersUrl)
        request.httpMethod = HTTPMethods.POST.rawValue
        request.setValue(HTTPContentType.JSON.rawValue, forHTTPHeaderField: HTTPHeaderField.ContentType.rawValue)
        let encoder = JSONEncoder()
        do {
            let newUserAsJSON = try encoder.encode(user)
            request.httpBody = newUserAsJSON
        } catch {
            print(error.localizedDescription)
            completionHandler(nil, error)
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            let decoder = JSONDecoder()
            do {
                guard let data = data else {return}
                let newUser = try decoder.decode(TraxUser.self, from: data)
                completionHandler(newUser, nil)
                let userDefaults = UserDefaults.standard
                userDefaults.set(newUser.userType, forKey: "userType")
                print(newUser.firstName)
            } catch {
                
            }
        })
        task.resume()
    }
    
    
        static func getUser(for uid: String, completionHandler: @escaping (TraxUser?, Error?) -> Void) {
            let usersEndpoint = "\(Endpoints.Users.baseUrl)\(Endpoints.Users.getByUid)\(uid)"
            guard let usersUrl = URL(string: usersEndpoint) else {return}
            print(usersUrl)
            let request = URLRequest(url: usersUrl)
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: {
                (data, response, error) in
                let decoder = JSONDecoder()
                do {
                    let user = try decoder.decode(TraxUser.self, from: data!)
                    completionHandler(user, nil)
                    let userDefaults = UserDefaults.standard
                    userDefaults.set(user.userType, forKey: "userType")
                    userDefaults.set(user.id, forKey: "userId")
                } catch {
                    completionHandler(nil, error)
                }
            })
            task.resume()
        }
    
    
    
    
}


enum UserType: String {
    case owner = "owner"
    case biker = "rider"
}
