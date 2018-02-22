//
//  SearchTracksTVExt.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 21/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


extension SearchTracksVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch estimatedTracks.count {
        case 0:
            return tracks.count
        default:
            return estimatedTracks.count
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch estimatedTracks.count {
        case 0:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SearchTracksCell
            cell.setupCell(with: tracks[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SearchTracksCell
            cell.setupCell(with: estimatedTracks[indexPath.row])
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchTracksCell.self)
    }
    
    
}
