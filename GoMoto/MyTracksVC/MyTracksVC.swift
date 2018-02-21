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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    
    
    
    

}
