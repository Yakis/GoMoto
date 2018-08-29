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
    
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        self.name = document.get("name") as? String ?? ""
        self.adress = document.get("adress") as? String ?? ""
        self.postcode = document.get("postcode") as? String ?? ""
        self.latitude = document.get("latitude") as? Double ?? 0.0
        self.longitude = document.get("longitude") as? Double ?? 0.0
        self.soilType = document.get("soilType") as? String ?? ""
        self.openingTimes = document.get("openingTimes") as? String ?? ""
        self.prices = document.get("prices") as? String ?? ""
        self.childFriendly = document.get("childFriendly") as? Bool ?? false
        self.rating = document.get("rating") as? Double ?? 0.0
        self.userId = document.get("userId") as? String ?? ""
        self.featured = document.get("featured") as? Int ?? 0
        self.image = document.get("image") as? String ?? ""
        self.distance = document.get("distance") as? Double ?? 0.0
        self.favoritesCount = document.get("favoritesCount") as? Int ?? 0
    }
    
    
    init(id: String?,
    name: String,
    adress: String,
    postcode: String,
    latitude: Double,
    longitude: Double,
    soilType: String,
    openingTimes: String,
    prices: String,
    childFriendly: Bool,
    rating: Double,
    userId: String,
    featured: Int,
    image: String,
    distance: Double?,
    favoritesCount: Int) {
        
        self.name = name
        self.adress = adress
        self.postcode = postcode
        self.latitude = latitude
        self.longitude = longitude
        self.soilType = soilType
        self.openingTimes = openingTimes
        self.prices = prices
        self.childFriendly = childFriendly
        self.rating = rating
        self.userId = userId
        self.featured = featured
        self.image = image
        self.distance = distance
        self.favoritesCount = favoritesCount
    }
    
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
                let track = Track(document: document)
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
                let track = Track(document: document)
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
