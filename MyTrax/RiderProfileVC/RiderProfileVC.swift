//
//  RiderProfileVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 08/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import Firebase

class RiderProfileVC: UIViewController {

    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logoutButtonOutlet: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButtonOutlet.roundCorners()
        guard let username = Auth.auth().currentUser?.displayName else {return}
        welcomeLabel.text = "Welcome, \(username)"
        // Do any additional setup after loading the view.
    }

    
    @IBAction func logoutButtonAction(_ sender: Any) {
        do {
       try Auth.auth().signOut()
        self.present(AppController.createAndReturnRoot(), animated: true, completion: nil)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    

}
