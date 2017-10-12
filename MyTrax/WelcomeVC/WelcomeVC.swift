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
        ownerButton.layer.borderColor = UIColor.darkGray.cgColor
        bikerButton.layer.borderColor = UIColor.darkGray.cgColor
        
        ownerButton.layer.borderWidth = 0.5
        bikerButton.layer.borderWidth = 0.5
        traxLogoImageView.layer.shadowRadius = 2.0
        traxLogoImageView.layer.shadowColor = UIColor.darkGray.cgColor
        traxLogoImageView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        traxLogoImageView.rotate(duration: 0.7, from: -1.0, to: 0.0)
        
    }

    
    @IBAction func ownerButtonAction(_ sender: Any) {
        let registerOwnerVC = RegisterOwnerVC(nibName: "RegisterOwnerVC", bundle: nil)
        self.present(registerOwnerVC, animated: true, completion: nil)
    }
    
    
    @IBAction func userButtonAction(_ sender: Any) {
    }
    
    
    

}
