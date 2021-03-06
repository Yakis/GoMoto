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
    
    var id: String?
    var content: String
    var image: String
    var trackId: String
    var userId: String
    var trackName: String
    var trackIcon: String
    var createdAt: String?
    var updatedAt: String?
    var likesCount: Int
    var commentsCount: Int
    
    
    static func savePost(post: Post, completionHandler: @escaping (Post?, Error?) -> Void) {
        let postsEndpoint = "\(Endpoints.Posts.baseUrl)\(Endpoints.createNew)"
        guard let postsUrl = URL(string: postsEndpoint) else {return}
        var request = URLRequest(url: postsUrl)
        request.httpMethod = HTTPMethods.POST.rawValue
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue)
        request.setValue(HTTPContentType.JSON.rawValue, forHTTPHeaderField: HTTPHeaderField.ContentType.rawValue)
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        do {
            let newPostAsJSON = try encoder.encode(post)
            request.httpBody = newPostAsJSON
        } catch {
            print(error.localizedDescription)
            completionHandler(nil, error)
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            guard let data = data else {return}
            do {
                let newPost = try decoder.decode(Post.self, from: data)
                completionHandler(newPost, nil)
            } catch {
                
            }
        })
        task.resume()
    }
    
    
    static func getAllPosts(completionHandler: @escaping ([Post]?, Error?) -> Void) {
        let postsEndpoint = "\(Endpoints.Posts.baseUrl)\(Endpoints.getAll)"
        guard let postsUrl = URL(string: postsEndpoint) else {return}
        print(postsUrl)
        var request = URLRequest(url: postsUrl)
        request.httpMethod = HTTPMethods.GET.rawValue
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue)
        request.setValue(HTTPContentType.JSON.rawValue, forHTTPHeaderField: HTTPHeaderField.ContentType.rawValue)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
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
