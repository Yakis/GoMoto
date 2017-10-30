//
//  AditionalInfoVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 30/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class AditionalInfoVC: UIViewController {

    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var userType: UILabel!
    
    @IBOutlet weak var firebaseUID: UILabel!
    
    
    var user: TraxUser!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstName.text = "First Name: \(user.first_name!)"
        self.lastName.text = "Last Name: \(user.last_name!)"
        self.email.text = "Email: \(user.email!)"
        self.phoneNumber.text = "Contact number: \(user.contact_number!)"
        self.userType.text = "User type: \(user.user_type!)"
        self.firebaseUID.text = "Firebase UID: \(user.firebase_uid!)"
        
    }


}
