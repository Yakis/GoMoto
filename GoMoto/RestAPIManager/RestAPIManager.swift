//
//  RestAPIManager.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 11/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation
import Firebase

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
    
    

    
    
    
        
    
    
    
    
    
    
    
    
}
