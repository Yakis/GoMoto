//
//  AddTracksVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 01/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class AddTracksVC: UIViewController, LocateTrackDelegate {
    
    

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }

    
    
    func showMapView() {
        let locateTrackVC = LocateTrackVC(nibName: "LocateTrackVC", bundle: nil)
        self.present(locateTrackVC, animated: true, completion: nil)
    }
    

}
