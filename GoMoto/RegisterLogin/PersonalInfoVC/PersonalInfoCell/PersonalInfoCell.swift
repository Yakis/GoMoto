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


class PersonalInfoCell: UITableViewCell, NibLoadable, ReusableView, UITextFieldDelegate {

    
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
        self.emailField.text = user.email
        self.firstNameField.text = user.firstName
        self.lastNameField.text = user.lastName
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        phoneNumberField.delegate = self
        
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        validatePhoneTextField(textField: textField, character: string)
        return true
    }
    
    
    func validatePhoneTextField(textField: UITextField, character: String) {
        guard let text = textField.text else {return}
        let string = text + character
        if string.isValidPhone() {
            textField.validate()
        } else {
            textField.invalidate()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        guard let firstName = self.firstNameField.text else {return}
        guard let lastName = self.lastNameField.text else {return}
        guard let email = emailField.text else {return}
        guard let phoneNumber = phoneNumberField.text else {return}
        guard let uid = self.user.id else {return}
        let userType = self.user.userType
        let user = TraxUser(id: uid, username: "", email: email, firstName: firstName, lastName: lastName, postcode: "", contactNumber: phoneNumber, userType: userType, avatar: "", deviceToken: "")
        self.delegate?.personalInfoReady(with: user)
    }
    
    
    
}
