//
//  LocateTrackVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 01/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import MapKit


class LocateTrackVC: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var doneButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButtonOutlet.roundCorners()
    }

    
    
    @IBAction func doneButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
