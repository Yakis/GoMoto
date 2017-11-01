//
//  AddTrackFieldsCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 01/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class AddTrackFieldsCell: UITableViewCell, NibLoadable, ReusableView {

    
    @IBOutlet weak var trackNameField: UITextField!
    
    @IBOutlet weak var trackAdressField: UITextField!
    
    @IBOutlet weak var trackPostcodeField: UITextField!
    
    @IBOutlet weak var trackSoilField: UITextField!
    
    @IBOutlet weak var trackOpeningField: UITextField!
    
    @IBOutlet weak var trackPricesField: UITextField!
    
    @IBOutlet weak var createButtonOutlet: UIButton!
    
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createButtonOutlet.roundCorners()
        // Initialization code
    }

    
    @IBAction func createButtonAction(_ sender: Any) {
        print("Create!")
    }
    
    
    @IBAction func localizationButtonAction(_ sender: Any) {
        print("Show the map")
    }
    
    
    
    
}
