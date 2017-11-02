//
//  Utils.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 25/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import Foundation



extension String {
    
    func splitName() -> [String] {
        return self.components(separatedBy: " ")

    }
    
}



extension Notification.Name {
    static let adressIsReady = Notification.Name(rawValue: "AdressIsReady")
}
