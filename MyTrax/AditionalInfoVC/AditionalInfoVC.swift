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
        finishButtonOutlet.roundCorners()
        setupMessage()
    }

    
    func setupMessage() {
        switch user.user_type {
        case "rider":
            messageLabel.text = "People want to know who you are when you posting something. Just enter your username and you're in! We recomend your name and bike No. i.e. <Ben672>"
        default:
            messageLabel.text = "People want to know who you are when you posting something. Just enter your username and you're in! We recomend your track name i.e. <Wild Tracks>"
        }
    }
    
    
    
    @IBAction func finishButtonAction(_ sender: Any) {
        guard let username = usernameTextField.text else {return}
        user.username = username
        RestAPIManager.shared.saveUser(user: user) { (savedUser, error)  in
            guard let savedUser = savedUser else {return}
            DispatchQueue.main.async {
                switch savedUser.user_type {
                case "owner":
                let addTracksVC = AddTracksVC(nibName: "AddTracksVC", bundle: nil)
                addTracksVC.user = savedUser
                self.present(addTracksVC, animated: true, completion: nil)
                default:
                    let userDashboardVC = UserDashboardVC(nibName: "UserDashboardVC", bundle: nil)
                    userDashboardVC.user = savedUser
                    self.present(userDashboardVC, animated: true, completion: nil)
            }
            }
            guard let error = error else {return}
            UserAlert.showMessage(from: self, title: "Error", message: error.localizedDescription)
        }
    }
    
    

}
