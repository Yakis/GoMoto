//
//  TextFieldExtension.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 25/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

extension EmailRegistrationCell: UITextFieldDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let placeholder = textField.placeholder {
        switch placeholder {
        case "email":
            validateEmailTextField(textField: textField, character: string)
        case "password":
            validatePasswordTextField(textField: textField, character: string)
            case "retype password":
                validateRetypeTextField(textField: textField, character: string)
        default:
            print("Nothing else")
        }
        }
        return true
    }

    
    func validateEmailTextField(textField: UITextField, character: String) {
        guard let text = textField.text else {return}
        let string = text + character
        if string.contains("@") && string.contains(".") {
            textField.validate()
        } else if !text.contains("@") || !text.contains(".") {
            textField.invalidate()
        }
    }
    
    func validatePasswordTextField(textField: UITextField, character: String) {
        guard let text = textField.text else {return}
        let string = text + character
        if string.count >= 6 {
            textField.validate()
        } else {
            textField.invalidate()
        }
    }
    
    func validateRetypeTextField(textField: UITextField, character: String) {
        guard let text = textField.text else {return}
        let string = text + character
        guard let password = passwordTextField.text else {return}
        if (string == password) {
            textField.validate()
        } else if (text != password) {
            textField.invalidate()
        }
    }
    
    
}
