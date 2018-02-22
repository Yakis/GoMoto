//
//  MyTracksTVExt.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 21/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

extension MyTracksVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tracks.count {
        case 0:
            return 1
        default:
            return tracks.count
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tracks.count {
        case 0:
            let placeholderCell = tableView.dequeueReusableCell(forIndexPath: indexPath) as PlaceholderCell
            placeholderCell.setupCell(with: "You don't have any favorite track yet. You can add tracks from top right corner button.")
            return placeholderCell
        default:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MyTracksListCell
            cell.setupCell(with: tracks[indexPath.row])
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tracks.count {
        case 0:
            return tableView.frame.size.height
        default:
            return 100
        }
    }
    
    
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyTracksListCell.self)
        tableView.register(PlaceholderCell.self)
    }
    
    
    
    
    
    
    
}
