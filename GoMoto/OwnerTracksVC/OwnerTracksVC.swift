//
//  OwnerTracksVC.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 19/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class OwnerTracksVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var tracks: [Track] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getOwnerTracks()
    }


    
    func getOwnerTracks () {
        Track.getTracksByOwner(ownerId: 1) { [weak self] (tracks, error) in
            guard let tracks = tracks else {
                print(error?.localizedDescription)
                return
            }
            self?.tracks = tracks
        }
    }
    
    
}
