//
//  AditionalInfoVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 30/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit


class AditionalInfoVC: UIViewController {

    
    var user: TraxUser!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var finishButtonOutlet: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let userType = user.user_type else {return}
        finishButtonOutlet.roundCorners()
        switch userType {
        case "rider":
            messageLabel.text = "People want to know who you are when you posting something. Just enter your username and you're in! We recomend your name and  bike No. i.e. <Ben672>"
        default:
            messageLabel.text = "People want to know who you are when you posting something. Just enter your username and you're in! We recomend your track name ie. <Wild Tracks>"
        }
    }

    
    @IBAction func finishButtonAction(_ sender: Any) {
    }
    
    

}
