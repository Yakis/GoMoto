//
//  Constants.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 09/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit


enum HTTPMethods: String {
    case GET = "GET"
    case POST = "POST"
    case PATCH = "PATCH"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

enum HTTPContentType: String {
    case JSON = "application/json"
}

enum HTTPHeaderField: String {
    case Authorization = "Authorization"
    case ContentType = "Content-Type"
}

struct DashboardNibs {
    
    static let dashboardVC = "DashboardVC"
    static let trackListCell = "TrackListCell"
    
}

struct WelcomeNibs {
    static let welcomeVC = "WelcomeVC"
}


struct Endpoints {
    
    static let getAll = "/all"
    static let createNew = "/create"
    static let like = "/like"
    //static let likesCount = "/post?id="
    static let favorites = "/favorites"
    static let favoriteTracks = "/favoriteTracks"
    static let favs = "/favs"
    static let userIdKey = "?userId="
    static let trackIdKey = "&trackId="
    
    struct Users {
        static let baseUrl = "https://serveroo.herokuapp.com/users"
        static let getByUid = "?uid="
    }

    struct Tracks {
        static let baseUrl = "https://serveroo.herokuapp.com/tracks"
    }
    
    struct Posts {
        static let baseUrl = "https://serveroo.herokuapp.com/posts"
    }
    
    
    struct Images {
        static let baseUrl = "https://serveroo.herokuapp.com/images"
    }
    
    
}
