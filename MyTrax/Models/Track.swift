//
//  Track.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 01/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation


struct Track: Codable {

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
    var images: [String] = []
    
    
}
