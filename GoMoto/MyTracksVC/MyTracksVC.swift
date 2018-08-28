//
//  MyTracksVC.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 21/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class MyTracksVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var tracks: [Track] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getFavoriteTracks()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchTracksButton()
    }

    
    
    
    func setupSearchTracksButton() {
        let addTrackButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(MyTracksVC.searchTracksButtonAction))
        self.navigationItem.rightBarButtonItem = addTrackButton
    }
    
    
    @objc func searchTracksButtonAction() {
        let searchTracksVC = SearchTracksVC(nibName: "SearchTracksVC", bundle: nil)
        self.navigationController?.pushViewController(searchTracksVC, animated: true)
    }
    
    
    
    func getFavoriteTracks() {
        guard let userId = UserDefaults.standard.value(forKey: "uid") as? String else {return}
        Track.getFavoriteTracks(for: userId) { [weak self] (tracks, error) in
            guard let tracks = tracks else {return}
            self?.tracks = tracks
        }
    }
    
    

}
