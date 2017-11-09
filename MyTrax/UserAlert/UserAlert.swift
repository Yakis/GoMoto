//
//  UserAlert.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 31/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class UserAlert {
    
    static func showMessage(from viewController: UIViewController?, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            
        }
        alert.addAction(action)
        guard let viewController = viewController else {return}
        viewController.present(alert, animated: true)
    }
}
