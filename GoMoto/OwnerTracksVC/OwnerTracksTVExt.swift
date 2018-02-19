//
//  OwnerTracksTVExt.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 19/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


extension OwnerTracksVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as OwnerTrackListCell
        cell.setupCell(with: tracks[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    func setupTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OwnerTrackListCell.self)
    }
    
}
