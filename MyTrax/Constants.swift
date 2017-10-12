//
//  Constants.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 09/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation


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
    
    struct Owners {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/owners"
        
    }
    
    struct Tracks {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/tracks"
    }
    
    struct Images {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/images"
    }
}
