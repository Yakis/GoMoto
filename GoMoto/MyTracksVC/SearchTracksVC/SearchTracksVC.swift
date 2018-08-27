//
//  SearchTracksVC.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 21/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import CoreLocation

class SearchTracksVC: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var userLocation: CLLocation!
    
    var favoritesIds: [Int] = []
    
    var estimatedTracks: [Track] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    var tracks: [Track] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        getFavoriteIds()
        getAllTracks()
    }

    
    func getFavoriteIds() {
        guard let userId = UserDefaults.standard.value(forKey: "userId") as? Int else {return}
        Track.getFavoriteTracksIds(for: userId) { [weak self] (favs, error) in
            if error == nil {
                guard let favs = favs else {return}
                for fav in favs {
                    self?.favoritesIds.append(fav.trackId)
                }
            }
        }
    }
    
    
    func getAllTracks() {
        Track.getAllTracks { [weak self] (tracks, error) in
            if error == nil {
                guard let tracks = tracks else {return}
                self?.tracks = tracks
            }
        }
    }
    
    
    
    
}
