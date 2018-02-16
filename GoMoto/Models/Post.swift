//
//  Post.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 09/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import Foundation
import Firebase

struct Post: Codable {
    
    var id: Int
    var content: String
    var image: String
    var track_id: Int
    var track_name: String
    var track_icon: String
    var created_at: String
    var updated_at: String
    var likes_count: Int
    var comments_count: Int
    
    
    static func getAllPosts(completionHandler: @escaping ([Post]?, Error?) -> Void) {
        let postsEndpoint = "\(Endpoints.Posts.baseUrl)\(Endpoints.getAll)"
        guard let postsUrl = URL(string: postsEndpoint) else {return}
        print(postsUrl)
        var request = URLRequest(url: postsUrl)
        request.httpMethod = "GET"
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("RESPONSE: \(response)")
            let decoder = JSONDecoder()
            do {
                guard let data = data else {return}
                let posts = try decoder.decode([Post].self, from: data)
                completionHandler(posts, nil)
            } catch {
                print(error.localizedDescription)
            }
            print("Success! You have posts")
        }
        })
        task.resume()
    }
    
    
    
    
}
