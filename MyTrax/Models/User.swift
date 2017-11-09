//
//  Owner.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 11/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation

struct TraxUser: Codable {
    
    var id: Int = 0
    var username: String = ""
    var email: String = ""
    var first_name: String = ""
    var last_name: String = ""
    var postcode: String = ""
    var contact_number: String = ""
    var user_type: String = ""
    var avatar: String = ""
    var device_token: String = ""
    var firebase_uid: String = ""
    var created_at: Date?
    var updated_at: Date?
    
    
    static func save(user: TraxUser, completionHandler: @escaping (TraxUser?, Error?) -> Void) {
        let usersEndpoint = "\(Endpoints.Users.baseUrl)\(Endpoints.createNew)"
        guard let usersUrl = URL(string: usersEndpoint) else {return}
        print(usersUrl)
        var request = URLRequest(url: usersUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        do {
            let newUserAsJSON = try encoder.encode(user)
            request.httpBody = newUserAsJSON
        } catch {
            print(error)
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
            } catch {
                
            }
            print("\(String(describing: response)) Account created!")
        })
        task.resume()
    }
    
    
}


enum UserType: String {
    case owner = "owner"
    case biker = "rider"
}
