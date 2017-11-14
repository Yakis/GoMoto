//
//  Constants.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 09/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit


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
    
    struct Users {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/users"
       // static let baseUrl = "http://192.168.0.27:8080/api/v1/users"
        
    }
    
    struct Tracks {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/tracks"
    }
    
    struct Images {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/images"
    }
}
