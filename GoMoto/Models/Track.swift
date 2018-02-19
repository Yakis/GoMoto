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
    var soil_type: String
    var opening_times: String
    var prices: String
    var child_friendly: Bool
    var rating: Double
    var user_id: Int
    var featured: Int
    var image: String
    
    
    
    static func saveTrack(track: Track, completionHandler: @escaping (Track?, Error?) -> Void) {
        let tracksEndpoint = "\(Endpoints.Tracks.baseUrl)\(Endpoints.createNew)"
        guard let tracksUrl = URL(string: tracksEndpoint) else {return}
        var request = URLRequest(url: tracksUrl)
        request.httpMethod = "POST"
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        do {
            let newTrackAsJSON = try encoder.encode(track)
            request.httpBody = newTrackAsJSON
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
                
            }
        })
        task.resume()
    }
    
    
    static func getAllTracks(completionHandler: @escaping ([Track]?, Error?) -> Void) {
        let tracksEndpoint = "\(Endpoints.Tracks.baseUrl)\(Endpoints.getAll)"
        guard let tracksUrl = URL(string: tracksEndpoint) else {return}
        print(tracksUrl)
        var request = URLRequest(url: tracksUrl)
        request.httpMethod = "GET"
        guard let uid = Auth.auth().currentUser?.uid else {return}
        request.setValue(uid, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
    
    
    
    static func getTracksByOwner(ownerId: Int, completionHandler: @escaping ([Track]?, Error?) -> Void) {
        let tracksEndpoint = "\(Endpoints.Tracks.baseUrl)?userid=\(ownerId)"
        guard let tracksUrl = URL(string: tracksEndpoint) else {return}
        print(tracksUrl)
        var request = URLRequest(url: tracksUrl)
        request.httpMethod = "GET"
        guard let uid = Auth.auth().currentUser?.uid else {return}
        print("UID=== \(uid)")
        request.setValue(uid, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
    
    
    
    
    
}
