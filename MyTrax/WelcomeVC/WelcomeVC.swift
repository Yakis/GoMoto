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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        ownerButton.roundCorners()
        bikerButton.roundCorners()
        traxLogoImageView.addShadow()
    }
    
    
    @IBAction func ownerButtonAction(_ sender: Any) {
        showRegistrationVC(userType: "owner", imageName: "OwnerLogo")
    }
    
    
    @IBAction func userButtonAction(_ sender: Any) {
        showRegistrationVC(userType: "biker", imageName: "UserLogo")
    }
    
    
    func showRegistrationVC(userType: String, imageName: String) {
        let registerVC = RegisterVC(nibName: "RegisterVC", bundle: nil)
        let info = ["userType": userType, "imageName": imageName]
        registerVC.userInfo = info
       self.present(registerVC, animated: true, completion: nil)
    }
    

}
