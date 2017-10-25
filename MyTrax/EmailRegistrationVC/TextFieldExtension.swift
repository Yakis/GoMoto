//
//  TextFieldExtension.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 25/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

extension EmailRegistrationVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
    print(reason)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let placeholder = textField.placeholder {
        switch placeholder {
        case "email":
            validateEmailTextField(textField: textField, character: string)
        case "password":
            validatePasswordTextField(textField: textField, character: string)
        default:
            validateRetypeTextField(textField: textField, character: string)
        }
        }
        return true
    }

    
    func validateEmailTextField(textField: UITextField, character: String) {
        guard let text = textField.text else {return}
        let string = text + character
        print("TEXT=== \(text)")
        print("STRING=== \(string)")
        if string.contains("@") && string.contains(".") {
            textField.validate()
        } else if !text.contains("@") || !text.contains(".") {
            textField.invalidate()
        }
    }
    
    func validatePasswordTextField(textField: UITextField, character: String) {
        guard let text = textField.text else {return}
        let string = text + character
        if string.characters.count >= 6 {
            textField.validate()
        } else {
            textField.invalidate()
        }
    }
    
    func validateRetypeTextField(textField: UITextField, character: String) {
        guard let text = textField.text else {return}
        let string = text + character
        let password = self.passwordField
        if (string == password?.text) {
            textField.validate()
        } else if (text != password?.text) {
            textField.invalidate()
        }
    }
    
    
}
