//
//  Owner.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 11/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var id: Int?
    var username: String
    var email: String
    var first_name: String
    var last_name: String
    var postcode: String
    var contact_number: String
    var user_type: String
    var avatar: String
    var device_token: String
    var facebook_uid: String
    var created_at: Date?
    var updated_at: Date?
}
