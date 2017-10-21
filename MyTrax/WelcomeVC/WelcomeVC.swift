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
        let registerOwnerVC = RegisterOwnerVC(nibName: "RegisterOwnerVC", bundle: nil)
        self.present(registerOwnerVC, animated: true, completion: nil)
    }
    
    
    @IBAction func userButtonAction(_ sender: Any) {
    }
    
    
    

}
