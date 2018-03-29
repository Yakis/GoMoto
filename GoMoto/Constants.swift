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
    static let likes = "/likes"
    static let likesCount = "/post?id="
    static let favorites = "/favorites"
    static let favs = "/favs"
    static let user_idKey = "?user_id="
    static let track_idKey = "&track_id="
    
    struct Users {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/users"
        static let getByUid = "?uid="
    }

    struct Tracks {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/tracks"
    }
    
    struct Posts {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/posts"
    }
    
    
    struct Images {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/images"
    }
    
    
}
