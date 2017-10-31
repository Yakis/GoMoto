//
//  PersonalInfoCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 30/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

protocol PersonalInfoDelegate: class {
    func personalInfoReady(with user: TraxUser)
}


class PersonalInfoCell: UITableViewCell, NibLoadable, ReusableView {

    
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var phoneNumberField: UITextField!
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    weak var delegate: PersonalInfoDelegate?
    
    var user: TraxUser!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonOutlet.roundCorners()
        // Initialization code
    }
    
    
    func setupCell(with user: TraxUser) {
        self.user = user
        guard let email = user.email else {return}
        self.emailField.text = email
        guard let firstName = user.first_name else {return}
        self.firstNameField.text = firstName
        guard let lastName = user.last_name else {return}
        self.lastNameField.text = lastName
        
    }

    
    @IBAction func buttonAction(_ sender: Any) {
        guard let firstName = self.firstNameField.text else {return}
        guard let lastName = self.lastNameField.text else {return}
        guard let email = emailField.text else {return}
        guard let phoneNumber = phoneNumberField.text else {return}
        guard let userType = self.user.user_type else {return}
        guard let firebaseUID = self.user.firebase_uid else {return}
        let user = TraxUser(id: nil, username: nil, email: email, first_name: firstName, last_name: lastName, postcode: nil, contact_number: phoneNumber, user_type: userType, avatar: nil, device_token: nil, firebase_uid: firebaseUID, created_at: nil, updated_at: nil)
        self.delegate?.personalInfoReady(with: user)
    }
    
    
    
}
