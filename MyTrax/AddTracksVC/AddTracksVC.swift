//
//  AddTracksVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 01/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class AddTracksVC: UIViewController, LocateTrackDelegate, AdminVCDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var user: TraxUser!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }

    
    
    func showMapView() {
        let locateTrackVC = LocateTrackVC(nibName: "LocateTrackVC", bundle: nil)
        self.present(locateTrackVC, animated: true, completion: nil)
    }
    
    
    func showAdminVC(for user: TraxUser, with track: Track) {
        let adminVC = AdminVC(nibName: "AdminVC", bundle: nil)
        adminVC.user = user
        adminVC.track = track
        self.present(adminVC, animated: true, completion: nil)
    }

}
