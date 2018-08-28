//
//  Track.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 01/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation
import Firebase



extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}

struct Track: Codable {

    
    
    var id: String?
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
    var userId: String
    var featured: Int
    var image: String
    var distance: Double?
    var favoritesCount: Int
    
    
    
    static func saveTrack(track: Track, completionHandler: @escaping (Track?, Error?) -> Void) {
        let db = Firestore.firestore()
        let tracksCollectionRef = db.collection("tracks")
        do {
                let dict = try track.asDictionary()
            tracksCollectionRef.addDocument(data: dict)
            completionHandler(track, nil)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    static func getAllTracks(completionHandler: @escaping ([Track]?, Error?) -> Void) {
        var tracksArray = [Track]()
        let db = Firestore.firestore()
        let tracksCollectionRef = db.collection("tracks")
        tracksCollectionRef.getDocuments { (snap, error) in
            guard let documents = snap?.documents else {return}
            for document in documents {
                let id = document.documentID
                guard let name = document.get("name") as? String else {return}
                guard let adress = document.get("adress") as? String else {return}
                guard let postcode = document.get("postcode") as? String else {return}
                guard let latitude = document.get("latitude") as? Double else {return}
                guard let longitude = document.get("longitude") as? Double else {return}
                guard let soilType = document.get("soilType") as? String else {return}
                guard let openingTimes = document.get("openingTimes") as? String else {return}
                guard let prices = document.get("prices") as? String else {return}
                guard let childFriendly = document.get("childFriendly") as? Bool else {return}
                guard let rating = document.get("rating") as? Double else {return}
                guard let userId = document.get("userId") as? String else {return}
                guard let featured = document.get("featured") as? Int else {return}
                guard let image = document.get("image") as? String else {return}
                guard let distance = document.get("distance") as? Double else {return}
                guard let favoritesCount = document.get("favoritesCount") as? Int else {return}
                let track = Track(id: id, name: name, adress: adress, postcode: postcode, latitude: latitude, longitude: longitude, soilType: soilType, openingTimes: openingTimes, prices: prices, childFriendly: childFriendly, rating: rating, userId: userId, featured: featured, image: image, distance: distance, favoritesCount: favoritesCount)
                tracksArray.append(track)
            }
            completionHandler(tracksArray, nil)
        }
        
    }
    
    
    static func getFavoriteTracks(for userId: String, completionHandler: @escaping ([Track]?, Error?) -> Void) {
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
    
    
    static func getTracksByOwner(ownerId: String, completionHandler: @escaping ([Track]?, Error?) -> Void) {
        var tracksArray = [Track]()
        let db = Firestore.firestore()
        let tracksCollectionRef = db.collection("tracks")
        let query = tracksCollectionRef.whereField("userId", isEqualTo: ownerId)
        query.getDocuments { (snap, error) in
            guard let documents = snap?.documents else {return}
            for document in documents {
                let id = document.documentID
                guard let name = document.get("name") as? String else {return}
                guard let adress = document.get("adress") as? String else {return}
                guard let postcode = document.get("postcode") as? String else {return}
                guard let latitude = document.get("latitude") as? Double else {return}
                guard let longitude = document.get("longitude") as? Double else {return}
                guard let soilType = document.get("soilType") as? String else {return}
                guard let openingTimes = document.get("openingTimes") as? String else {return}
                guard let prices = document.get("prices") as? String else {return}
                guard let childFriendly = document.get("childFriendly") as? Bool else {return}
                guard let rating = document.get("rating") as? Double else {return}
                guard let userId = document.get("userId") as? String else {return}
                guard let featured = document.get("featured") as? Int else {return}
                guard let image = document.get("image") as? String else {return}
                let distance = document.get("distance") as? Double ?? 0.0
                guard let favoritesCount = document.get("favoritesCount") as? Int else {return}
                let track = Track(id: id, name: name, adress: adress, postcode: postcode, latitude: latitude, longitude: longitude, soilType: soilType, openingTimes: openingTimes, prices: prices, childFriendly: childFriendly, rating: rating, userId: userId, featured: featured, image: image, distance: distance, favoritesCount: favoritesCount)
                tracksArray.append(track)
            }
            completionHandler(tracksArray, nil)
        }
    }
    
    
    
    static func getFavoriteTracksIds(for userId: String, completionHandler: @escaping ([FavoriteTrack]?, Error?) -> Void) {
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
