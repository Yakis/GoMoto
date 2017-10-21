//
//  ButtonBeautifier.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 21/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit


extension UIView {
    
    func roundCorners () {
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5.0
    }
    
    
    func addShadow () {
        self.layer.shadowRadius = 2.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.rotate(duration: 0.7, from: -1.0, to: 0.0)
    }
    
    
}
