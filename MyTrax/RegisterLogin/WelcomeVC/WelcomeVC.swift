//
//  WelcomeVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 09/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import FirebaseAuth

class WelcomeVC: UIViewController {

    
    @IBOutlet weak var ownerButton: UIButton!
    
    @IBOutlet weak var bikerButton: UIButton!
    
    @IBOutlet weak var traxLogoImageView: UIImageView!
    
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        UserAlert.askUserToAcceptPushNotifications()
    }

    func setupViews() {
        ownerButton.roundCorners()
        bikerButton.roundCorners()
        traxLogoImageView.addShadow()
    }
    
    
    @IBAction func ownerButtonAction(_ sender: Any) {
        showRegistrationVC(userType: UserType.owner)
    }
    
    
    @IBAction func userButtonAction(_ sender: Any) {
        showRegistrationVC(userType: UserType.biker)
    }
    
    
    func showRegistrationVC(userType: UserType) {
        let registerVC = RegisterVC(nibName: "RegisterVC", bundle: nil)
        registerVC.userType = userType
       self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    
    @IBAction func signInButtonAction(_ sender: Any) {
        let loginVC = LoginVC(nibName: "LoginVC", bundle: nil)
        self.present(loginVC, animated: true, completion: nil)
    }
    

}
