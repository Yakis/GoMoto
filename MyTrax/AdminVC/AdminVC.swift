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

    }

    
    
    func setupLabels() {
        self.welcomeLabel.text = "Welcome, \(user.first_name)!"
        self.trackName.text = track.name
        self.trackAdress.text = track.adress
        self.trackPostcode.text = track.postcode
        self.trackSoil.text = track.soil_type
        self.trackOpening.text = track.opening_times
        self.trackChild.text = "\(track.child_friendly)"
        self.trackPrices.text = track.prices
    }
    
    
    
}
