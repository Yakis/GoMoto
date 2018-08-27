//
//  AdminVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 02/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class AdminVC: UIViewController {

    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var trackName: UILabel!
    
    @IBOutlet weak var trackAdress: UILabel!
    
    @IBOutlet weak var trackPostcode: UILabel!
    
    @IBOutlet weak var trackSoil: UILabel!
    
    @IBOutlet weak var trackOpening: UILabel!
    
    @IBOutlet weak var trackChild: UILabel!
    
    @IBOutlet weak var trackPrices: UILabel!
    
    
    
   
    var user: TraxUser!
    var track: Track!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupLabels()
    }

    
    
    func setupLabels() {
        self.welcomeLabel.text = "Welcome, \(user.firstName)!"
        self.trackName.text = "Track name: \(track.name)"
        self.trackAdress.text = "Adress: \(track.adress)"
        self.trackPostcode.text = "Postcode: \(track.postcode)"
        self.trackSoil.text = "Soil type: \(track.soilType)"
        self.trackOpening.text = "Opening times: \(track.openingTimes)"
        switch track.childFriendly {
        case true:
            self.trackChild.text = "Child friendly: Yes"
        default:
            self.trackChild.text = "Child friendly: No"
        }
        
        self.trackPrices.text = "Prices: \(track.prices)"
    }
    
    
    
}
