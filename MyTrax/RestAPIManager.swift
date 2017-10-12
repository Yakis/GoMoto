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
                let articlesData = try decoder.decode([Owner].self, from: data)
                
                //Get back to the main queue
                DispatchQueue.main.async {
                    //print(articlesData)
                    //self.articles = articlesData
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
            }.resume()
    }
    
    
    
    func saveOwner(owner: Owner, completionHandler: @escaping (Error?) -> Void) {
        let ownersEndpoint = "\(Endpoints.Owners.baseUrl)\(Endpoints.createNew)"
        guard let ownersUrl = URL(string: ownersEndpoint) else {return}
        var ownersUrlRequest = URLRequest(url: ownersUrl)
        ownersUrlRequest.httpMethod = "POST"
        ownersUrlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        do {
            let newOwnerAsJSON = try encoder.encode(owner)
            ownersUrlRequest.httpBody = newOwnerAsJSON
        } catch {
            print(error)
            completionHandler(error)
        }
        
        // ...
        let session = URLSession.shared
        let task = session.dataTask(with: ownersUrlRequest, completionHandler: {
            (data, response, error) in
            completionHandler(error)
            print("\(String(describing: response)) Account created!")
        })
        task.resume()
    }
    
    
}
