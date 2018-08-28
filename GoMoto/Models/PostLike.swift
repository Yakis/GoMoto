//
//  PostLike.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 15/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import Foundation
import Firebase

struct PostLike: Codable {
    var id: String?
    var userId: String
    var postId: String
    
    
    
    
    
    static func likePost(like: PostLike, completionHandler: @escaping (Post?, Error?) -> Void) {
        let likesEndpoint = "\(Endpoints.Posts.baseUrl)\(Endpoints.like)"
        guard let likesUrl = URL(string: likesEndpoint) else {return}
        var request = URLRequest(url: likesUrl)
        request.httpMethod = HTTPMethods.POST.rawValue
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue)
        request.setValue(HTTPContentType.JSON.rawValue, forHTTPHeaderField: HTTPHeaderField.ContentType.rawValue)
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        do {
            let likeJSON = try encoder.encode(like)
            request.httpBody = likeJSON
        } catch {
            print(error.localizedDescription)
            completionHandler(nil, error)
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            guard let data = data else {return}
            do {
                let post = try decoder.decode(Post.self, from: data)
                completionHandler(post, nil)
            } catch {
                
            }
        })
        task.resume()
    }
    
    
}
