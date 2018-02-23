//
//  Utils.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 25/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import CoreLocation


extension String {
    
    func shortDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from:self) else {return "Invalid date format"}
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let convertedDate = dateFormatter.string(from: date)
        return String(describing: convertedDate)
    }
    
    func splitName() -> [String] {
        return self.components(separatedBy: " ")
    }
    
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPhone() -> Bool {
        let phoneRegEx = "^07([\\d]{3})[(\\D\\s)]?[\\d]{3}[(\\D\\s)]?[\\d]{3}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        let result = phoneTest.evaluate(with: self)
        return result
    }
    
}


extension UIColor {
    static let mediumGray = UIColor(red: 187/255, green: 195/255, blue: 198/255, alpha: 1.0)
    static let brickRed = UIColor(red: 150/255, green: 39/255, blue: 21/255, alpha: 1.0)
    static let matteBlack = UIColor(red: 30/255, green: 30/255, blue: 32/255, alpha: 1.0)
}


extension Notification.Name {
    static let adressIsReady = Notification.Name(rawValue: "AdressIsReady")
    static let imageUrlIsReady = Notification.Name(rawValue: "imageUrlIsReady")
}


extension CLLocationDistance {
    
    func toMiles() -> Double {
        return (self * 0.000621371192) * 1.2
    }
    
}


