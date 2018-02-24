//
//  FavoriteTrack.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 24/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import Foundation
import Firebase

struct FavoriteTrack: Codable {
    
    
    var user_id: Int
    var track_id: Int
    
    
    
    // WORK in progress
    static func setFavorite(favorite: FavoriteTrack, completionHandler: @escaping (Track?, Error?) -> Void) {
        let favoritesEndpoint = "\(Endpoints.Tracks.baseUrl)\(Endpoints.favorites)\(Endpoints.createNew)"
        guard let favoritesUrl = URL(string: favoritesEndpoint) else {return}
        var request = URLRequest(url: favoritesUrl)
        request.httpMethod = "POST"
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        do {
            let favoriteJSON = try encoder.encode(favorite)
            request.httpBody = favoriteJSON
        } catch {
            print(error.localizedDescription)
            completionHandler(nil, error)
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            guard let data = data else {return}
            do {
                let track = try decoder.decode(Track.self, from: data)
                completionHandler(track, nil)
            } catch {
                
            }
        })
        task.resume()
    }
    
    
    static func removeFavorite(favorite: FavoriteTrack, completionHandler: @escaping (String?, Error?) -> Void) {
        let likesEndpoint = "\(Endpoints.Tracks.baseUrl)\(Endpoints.favorites)\(Endpoints.user_idKey)\(favorite.user_id)\(Endpoints.track_idKey)\(favorite.track_id)"
        guard let likesUrl = URL(string: likesEndpoint) else {return}
        var request = URLRequest(url: likesUrl)
        request.httpMethod = "DELETE"
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let decoder = JSONDecoder()
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            guard let data = data else {return}
            do {
                let confirmation = try decoder.decode(String.self, from: data)
                completionHandler(confirmation, nil)
            } catch {
                
            }
        })
        task.resume()
    }
    
    
}
