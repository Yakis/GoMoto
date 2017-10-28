//
//  Constants.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 09/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

extension UIColor {
    static let mediumGray = UIColor(red: 187/255, green: 195/255, blue: 198/255, alpha: 1.0)
    static let brickRed = UIColor(red: 150/255, green: 39/255, blue: 21/255, alpha: 1.0)
    static let matteBlack = UIColor(red: 30/255, green: 30/255, blue: 32/255, alpha: 1.0)
}

struct Colors {
    static let mediumGray = UIColor(red: 187, green: 195, blue: 198, alpha: 1.0)
    static let brickRed = UIColor(red: 150, green: 39, blue: 21, alpha: 1.0)
    static let matteBlack = UIColor(red: 30, green: 30, blue: 32, alpha: 1.0)
    
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
    
    struct Users {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/users"
        
    }
    
    struct Tracks {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/tracks"
    }
    
    struct Images {
        static let baseUrl = "https://traxapiserver.herokuapp.com/api/v1/images"
    }
}
