//
//  Owner.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 11/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation

struct Owner: Codable {
    
    var id: Int?
    var email: String
    var first_name: String
    var last_name: String
    var contact_number: String
    var token: String
    var created_at: Date?
    var updated_at: Date?
}
