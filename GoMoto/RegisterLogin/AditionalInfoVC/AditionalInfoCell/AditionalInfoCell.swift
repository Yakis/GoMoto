//
//  AditionalInfoCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 06/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

protocol UsernameDelegate: class {
    func saveUser(with username: String)
}


class AditionalInfoCell: UITableViewCell, NibLoadable, ReusableView {

    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var finishButtonOutlet: UIButton!
    
    
    var user: TraxUser!
    weak var usernameDelegate: UsernameDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        finishButtonOutlet.roundCorners()
    }

    
    func setupCell(with user: TraxUser) {
        self.user = user
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
        self.usernameDelegate?.saveUser(with: username)
    }
    
    
    
    
    
}
