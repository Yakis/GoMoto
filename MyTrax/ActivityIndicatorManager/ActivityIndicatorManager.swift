//
//  ActivityIndicatorManager.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 06/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class ActivityIndicatorManager {
    
    
    static let shared = ActivityIndicatorManager()
    
    
    private init() {}
    
    
    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    
    func showActivityIndicator(on view: UIView, interactionEnabled: Bool) {
        if !activityIndicator.isAnimating {
            activityIndicator.center = view.center
            activityIndicator.isUserInteractionEnabled = interactionEnabled
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            activityIndicator.color = UIColor.mediumGray
            view.addSubview(activityIndicator)
        }
    }
    
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    
}
