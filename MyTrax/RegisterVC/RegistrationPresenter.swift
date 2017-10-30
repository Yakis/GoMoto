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
    
    func showPersonalInfoVC(with user: TraxUser, from viewController: UIViewController) {
        let personalInfoVC = PersonalInfoVC(nibName: "PersonalInfoVC", bundle: nil)
        personalInfoVC.user = user
        viewController.present(personalInfoVC, animated: true, completion: nil)
    }
    
    
    func showAditionalInfoVC(with user: TraxUser, from viewController: UIViewController) {
        let aditionalInfoVC = AditionalInfoVC(nibName: "AditionalInfoVC", bundle: nil)
        aditionalInfoVC.user = user
        viewController.present(aditionalInfoVC, animated: true, completion: nil)
    }
    
    
}
