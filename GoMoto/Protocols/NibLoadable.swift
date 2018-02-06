//
//  NibLoadable.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 27/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

protocol NibLoadable: class {}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
