//
//  AddTrackFieldsCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 01/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import MapKit


protocol LocateTrackDelegate: class {
    func showMapView()
}

class AddTrackFieldsCell: UITableViewCell, NibLoadable, ReusableView {
    
    
    @IBOutlet weak var trackNameField: UITextField!
    
    @IBOutlet weak var trackAdressField: UITextField!
    
    @IBOutlet weak var trackPostcodeField: UITextField!
    
    @IBOutlet weak var trackSoilField: UITextField!
    
    @IBOutlet weak var trackOpeningField: UITextField!
    
    @IBOutlet weak var trackPricesField: UITextField!
    
    @IBOutlet weak var createButtonOutlet: UIButton!
    
    
    weak var delegate: LocateTrackDelegate?
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createButtonOutlet.roundCorners()
        // Initialization code
    }

    
    @IBAction func createButtonAction(_ sender: Any) {
        print("Create!")
    }
    
    
    @IBAction func localizationButtonAction(_ sender: Any) {
        delegate?.showMapView()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(AddTrackFieldsCell.getAdress(notification:)), name: Notification.Name.adressIsReady, object: nil)
    }
    
    @objc func getAdress(notification: Notification) {
        guard let userInfo = notification.userInfo else {return}
        self.trackAdressField.text = userInfo["adress"] as? String
        self.trackPostcodeField.text = userInfo["postcode"] as? String
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: Notification.Name.adressIsReady, object: nil)
    }
    
    
    
}
