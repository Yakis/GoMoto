//
//  PersonalInfoCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 30/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

protocol PersonalInfoDelegate: class {
    func personalInfoReady(firstName: String, lastName: String, email: String, phoneNumber: String)
}


class PersonalInfoCell: UITableViewCell, NibLoadable, ReusableView {

    
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var phoneNumberField: UITextField!
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    weak var delegate: PersonalInfoDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setupCell(with user: TraxUser) {
        guard let email = user.email else {return}
        self.emailField.text = email
        guard let firstName = user.first_name else {return}
        self.firstNameField.text = firstName
        guard let lastName = user.last_name else {return}
        self.lastNameField.text = lastName
        buttonOutlet.roundCorners()
    }

    
    @IBAction func buttonAction(_ sender: Any) {
        guard let firstName = self.firstNameField.text else {return}
        guard let lastName = self.lastNameField.text else {return}
        guard let email = emailField.text else {return}
        guard let phoneNumber = phoneNumberField.text else {return}
        self.delegate?.personalInfoReady(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber)
    }
    
    
    
}
