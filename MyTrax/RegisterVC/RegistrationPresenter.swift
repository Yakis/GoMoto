//
//  RegistrationPresenter.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 29/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class RegistrationPresenter {

    
    static let shared = RegistrationPresenter()
    
    private init() {}
    
    func showRegistrationForm(with user: TraxUser, from viewController: UIViewController) {
        let personalInfoVC = PersonalInfoVC(nibName: "PersonalInfoVC", bundle: nil)
        personalInfoVC.user = user
        print("\(String(describing: user.user_type))\n\n\(String(describing: user.firebase_uid))\n\n\(String(describing: user.email))\n\n")
        viewController.present(personalInfoVC, animated: true, completion: nil)
    }
    
    
}
