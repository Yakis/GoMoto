//
//  PlaceholderCell.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 21/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class PlaceholderCell: UITableViewCell, NibLoadable, ReusableView {

    
    @IBOutlet weak var placeholderLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(with text: String) {
    placeholderLabel.text = text
        
    }
    
}
