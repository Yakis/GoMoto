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
    
    func showPersonalInfoVC(with user: TraxUser, from viewController: UIViewController?) {
        let personalInfoVC = PersonalInfoVC(nibName: "PersonalInfoVC", bundle: nil)
        let pers = UINavigationController(rootViewController: personalInfoVC)
        personalInfoVC.user = user
        pers.navigationController?.title = "Info"
        guard let viewController = viewController else {return}
        viewController.present(pers, animated: true, completion: nil)
    }
    
    
    func showAditionalInfoVC(with user: TraxUser, from viewController: UIViewController?) {
        let aditionalInfoVC = AditionalInfoVC(nibName: "AditionalInfoVC", bundle: nil)
        aditionalInfoVC.user = user
        guard let viewController = viewController else {return}
        viewController.navigationController?.pushViewController(aditionalInfoVC, animated: true)
    }
    
    
    func showAddTracksVC(with user: TraxUser, from viewController: UIViewController?) {
        let addTracksVC = AddTracksVC(nibName: "AddTracksVC", bundle: nil)
        addTracksVC.user = user
        guard let viewController = viewController else {return}
        viewController.present(addTracksVC, animated: true, completion: nil)
    }
    
    
    func showDashboardVC(with user: TraxUser, from viewController: UIViewController?) {
        guard let viewController = viewController else {return}
    viewController.present(AppController.createAndReturnRoot(), animated: true, completion: nil)
    }
    
    
    
    
    
}
