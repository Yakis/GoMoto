//
//  OwnerFormRegistrationVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 25/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class FormRegistrationVC: UIViewController {

    

    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
        
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completeFields()
        guard let type = user?.user_type else {return}
        print(type)
    }

    
    func completeFields() {
        self.firstNameField.text = user?.first_name
        self.lastNameField.text = user?.last_name
        self.emailField.text = user?.email
        
    }
    
    
    
    func saveRegisteredUserToBackend (uid: String) {
        print(uid)
        let user = User(id: nil, username: nil, email: nil, first_name: nil, last_name: nil, postcode: nil, contact_number: nil, user_type: "owner", avatar: nil, device_token: nil, firebase_uid: uid, created_at: nil, updated_at: nil)
        DispatchQueue.main.async {
        }
        //        RestAPIManager.shared.saveUser(user: user, completionHandler: { [weak self] (error) in
        //            if let error = error {
        //                print(error.localizedDescription)
        //            }
        //            DispatchQueue.main.async {
        //            self?.showOwnerView(with: user)
        //            }
        //        })
    }
    

}
