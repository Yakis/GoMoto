//
//  Track.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 01/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation
import Firebase

struct Track: Codable {

    var id: Int?
    var name: String
    var adress: String
    var postcode: String
    var latitude: Double
    var longitude: Double
    var soilType: String
    var openingTimes: String
    var prices: String
    var childFriendly: Bool
    var rating: Double
    var userId: Int
    var featured: Int
    var image: String
    var distance: Double?
    var favoritesCount: Int
    
    
    
    static func saveTrack(track: Track, completionHandler: @escaping (Track?, Error?) -> Void) {
        let tracksEndpoint = "\(Endpoints.Tracks.baseUrl)\(Endpoints.createNew)"
        guard let tracksUrl = URL(string: tracksEndpoint) else {return}
        var request = URLRequest(url: tracksUrl)
        request.httpMethod = HTTPMethods.POST.rawValue
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue)
        request.setValue(HTTPContentType.JSON.rawValue, forHTTPHeaderField: HTTPHeaderField.ContentType.rawValue)
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        do {
            let newTrackAsJSON = try encoder.encode(track)
            request.httpBody = newTrackAsJSON
            print(newTrackAsJSON)
        } catch {
            print(error.localizedDescription)
            completionHandler(nil, error)
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            guard let data = data else {return}
            do {
                let newTrack = try decoder.decode(Track.self, from: data)
                completionHandler(newTrack, nil)
            } catch {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    
    static func getAllTracks(completionHandler: @escaping ([Track]?, Error?) -> Void) {
        let tracksEndpoint = "\(Endpoints.Tracks.baseUrl)\(Endpoints.getAll)"
        guard let tracksUrl = URL(string: tracksEndpoint) else {return}
        var request = URLRequest(url: tracksUrl)
        request.httpMethod = HTTPMethods.GET.rawValue
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue)
        request.setValue(HTTPContentType.JSON.rawValue, forHTTPHeaderField: HTTPHeaderField.ContentType.rawValue)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            print(error?.localizedDescription ?? "Unknown error")
            let decoder = JSONDecoder()
            do {
                guard let data = data else {return}
                let tracks = try decoder.decode([Track].self, from: data)
                completionHandler(tracks, nil)
            } catch {
                
            }
            print("\(String(describing: response)) Account created!")
        })
        task.resume()
    }
    
    
    static func getFavoriteTracks(for userId: Int, completionHandler: @escaping ([Track]?, Error?) -> Void) {
        let tracksEndpoint = "\(Endpoints.Users.baseUrl)\(Endpoints.favoriteTracks)\(Endpoints.userIdKey)\(userId)"
        guard let tracksUrl = URL(string: tracksEndpoint) else {return}
        var request = URLRequest(url: tracksUrl)
        request.httpMethod = HTTPMethods.GET.rawValue
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue)
        request.setValue(HTTPContentType.JSON.rawValue, forHTTPHeaderField: HTTPHeaderField.ContentType.rawValue)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            print(error?.localizedDescription ?? "Unknown error")
            let decoder = JSONDecoder()
            do {
                guard let data = data else {return}
                let tracks = try decoder.decode([Track].self, from: data)
                completionHandler(tracks, nil)
            } catch {
                
            }
            print("\(String(describing: response)) Favorite tracks fetched!")
        })
        task.resume()
    }
    
    
    static func getTracksByOwner(ownerId: Int, completionHandler: @escaping ([Track]?, Error?) -> Void) {
        let tracksEndpoint = "\(Endpoints.Tracks.baseUrl)?userId=\(ownerId)"
        guard let tracksUrl = URL(string: tracksEndpoint) else {return}
        var request = URLRequest(url: tracksUrl)
        request.httpMethod = HTTPMethods.GET.rawValue
        guard let uid = Auth.auth().currentUser?.uid else {return}
        print("UID=== \(uid)")
        request.setValue(uid, forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue)
        request.setValue(HTTPContentType.JSON.rawValue, forHTTPHeaderField: HTTPHeaderField.ContentType.rawValue)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            print(error?.localizedDescription ?? "Unknown error")
            let decoder = JSONDecoder()
            do {
                guard let data = data else {return}
                let tracks = try decoder.decode([Track].self, from: data)
                completionHandler(tracks, nil)
            } catch {
                
            }
        })
        task.resume()
    }
    
    
    
    static func getFavoriteTracksIds(for userId: Int, completionHandler: @escaping ([FavoriteTrack]?, Error?) -> Void) {
        let tracksEndpoint = "\(Endpoints.Tracks.baseUrl)\(Endpoints.favs)\(Endpoints.userIdKey)\(userId)"
        guard let tracksUrl = URL(string: tracksEndpoint) else {return}
        var request = URLRequest(url: tracksUrl)
        request.httpMethod = HTTPMethods.GET.rawValue
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue)
        request.setValue(HTTPContentType.JSON.rawValue, forHTTPHeaderField: HTTPHeaderField.ContentType.rawValue)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            print(error?.localizedDescription ?? "Unknown error")
            let decoder = JSONDecoder()
            do {
                guard let data = data else {return}
                let tracks = try decoder.decode([FavoriteTrack].self, from: data)
                completionHandler(tracks, nil)
            } catch {
                
            }
            print("\(String(describing: response)) Favs fetched!")
        })
        task.resume()
    }
    
    
    
}
