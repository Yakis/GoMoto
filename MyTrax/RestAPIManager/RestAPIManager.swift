//
//  RestAPIManager.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 11/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation


class RestAPIManager {
    
    static let shared = RestAPIManager()
    
    private init() {}
    
    func getData() {
        let urlString = "https://swift.mrgott.pro/blog.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            //Implement JSON decoding and parsing
            do {
                //Decode retrived data with JSONDecoder and assing type of Article object
                let decoder = JSONDecoder()
                let owners = try decoder.decode([TraxUser].self, from: data)
                
                //Get back to the main queue
                DispatchQueue.main.async {
                    print(owners.count)
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
            }.resume()
    }
    
    
//    func getUser(user: TraxUser, completionHandler: @escaping (TraxUser?, Error?) -> Void) {
//        let usersEndpoint = "\(Endpoints.Users.baseUrl)\(Endpoints.createNew)"
//        guard let usersUrl = URL(string: usersEndpoint) else {return}
//        print(usersUrl)
//        var request = URLRequest(url: usersUrl)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        let encoder = JSONEncoder()
//        do {
//            let newUserAsJSON = try encoder.encode(user)
//            request.httpBody = newUserAsJSON
//        } catch {
//            print(error)
//            completionHandler(nil, error)
//        }
//        let session = URLSession.shared
//        let task = session.dataTask(with: request, completionHandler: {
//            (data, response, error) in
//            let decoder = JSONDecoder()
//            do {
//                let newUser = try decoder.decode(TraxUser.self, from: data!)
//                completionHandler(newUser, nil)
//            } catch {
//
//            }
//            print("\(String(describing: response)) Account created!")
//        })
//        task.resume()
//    }
    
    
    
    func saveUser(user: TraxUser, completionHandler: @escaping (TraxUser?, Error?) -> Void) {
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
                let newUser = try decoder.decode(TraxUser.self, from: data!)
                completionHandler(newUser, nil)
            } catch {
                
            }
            print("\(String(describing: response)) Account created!")
        })
        task.resume()
    }
    
    
    func saveTrack(track: Track, completionHandler: @escaping (Track?, Error?) -> Void) {
        let tracksEndpoint = "\(Endpoints.Tracks.baseUrl)\(Endpoints.createNew)"
        guard let tracksUrl = URL(string: tracksEndpoint) else {return}
        var request = URLRequest(url: tracksUrl)
        request.httpMethod = "POST"
        guard let accessToken = UserDefaults.standard.value(forKey: "accessToken") as? String else {return}
        request.setValue(accessToken, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        do {
            let newTrackAsJSON = try encoder.encode(track)
            request.httpBody = newTrackAsJSON
        } catch {
            print(error)
            completionHandler(nil, error)
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            do {
                let newTrack = try decoder.decode(Track.self, from: data!)
                completionHandler(newTrack, nil)
                print("\(String(describing: response)) Track \(newTrack.name) created!")
            } catch {
                
            }
            
        })
        task.resume()
    }
    
    
}
