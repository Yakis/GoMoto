//
//  AllTracksTVExt.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 07/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit


extension AllTracksVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TrackListCell
        cell.setupCell(with: tracks[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func setupTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TrackListCell.self)
    }
    
    
}
