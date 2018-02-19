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
    
    var user: TraxUser!
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
        getCurrentUser()
        setupAddTrackButton()
    }

    
    func getCurrentUser() {
        guard let uid = UserDefaults.standard.value(forKey: "uid") as? String else {return}
        TraxUser.getUser(for: uid) { [weak self] (user, error) in
            guard let user = user else {return}
            self?.user = user
        }
    }
    
    
    func setupAddTrackButton() {
        let addTrackButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(OwnerTracksVC.addTrackButtonAction))
        self.navigationItem.rightBarButtonItem = addTrackButton
    }
    

    @objc func addTrackButtonAction() {
        let addTrackVC = AddTracksVC(nibName: "AddTracksVC", bundle: nil)
        addTrackVC.user = user
        self.navigationController?.pushViewController(addTrackVC, animated: true)
    }
    
    
    func getOwnerTracks () {
        guard let userId: Int = UserDefaults.standard.value(forKey: "userId") as? Int else {
            print("No user id found!")
            return
        }
        Track.getTracksByOwner(ownerId: userId) { [weak self] (tracks, error) in
            guard let tracks = tracks else {
                print(error?.localizedDescription)
                return
            }
            self?.tracks = tracks
        }
    }
    
    
}
