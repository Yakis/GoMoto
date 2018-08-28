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
    
    
    // Present requested VC
    func showPersonalInfoVC(with user: TraxUser, from viewController: UIViewController?) {
        let personalInfoVC = PersonalInfoVC(nibName: "PersonalInfoVC", bundle: nil)
        personalInfoVC.user = user
        guard let viewController = viewController else {return}
        print("showPersonalInfoVC method \(user.id)")
        viewController.navigationController?.pushViewController(personalInfoVC, animated: true)
    }
    
    
    func showAditionalInfoVC(with user: TraxUser, from viewController: UIViewController?) {
        let aditionalInfoVC = AditionalInfoVC(nibName: "AditionalInfoVC", bundle: nil)
        aditionalInfoVC.user = user
        print("showAditionalInfoVC method \(user.id)")
        guard let viewController = viewController else {return}
        viewController.navigationController?.pushViewController(aditionalInfoVC, animated: true)
    }
    
    
    func showAddTracksVC(with user: TraxUser, from viewController: UIViewController?) {
        let addTracksVC = AddTracksVC(nibName: "AddTracksVC", bundle: nil)
        addTracksVC.user = user
        guard let viewController = viewController else {return}
        viewController.present(addTracksVC, animated: true, completion: nil)
    }
    
    
    func showRiderDashboardVC(from viewController: UIViewController?) {
        guard let viewController = viewController else {return}
    viewController.present(AppController.createAndReturnRiderTabBarController(), animated: true, completion: nil)
    }
    
    
    
    
    
}
