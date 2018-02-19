//
//  TrackDetailsTVExt.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 19/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

extension OwnerTrackDetails: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TrackDetailsImageCell
            cell.setupCell(with: track)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TrackDetailsAddPostCell
            cell.setupCell(with: track)
            return cell
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func setupTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TrackDetailsImageCell.self)
        tableView.register(TrackDetailsAddPostCell.self)
    }
    
    
    
    
}
