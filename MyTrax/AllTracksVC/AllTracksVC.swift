//
//  AllTracksVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 07/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

class AllTracksVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var tracks: [Track] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getAllTracks()
    }

    
    func getAllTracks() {
        Track.getAllTracks { (tracks, error) in
            guard let tracks = tracks else {return}
            self.tracks = tracks
        }
    }
    

}
