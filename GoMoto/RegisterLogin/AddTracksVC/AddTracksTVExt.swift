//
//  AddTracksTVExt.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 01/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

extension AddTracksVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TrackImageCell
            cell.addImageDelegate = self
            cell.setImageReadyDelegate(addTracksVC: self)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as AddTrackTitleCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as AddTrackFieldsCell
            cell.setupCell(with: user)
            cell.delegate = self
            cell.adminDelegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 50
        case 2:
            return 370
        default:
            return 100
        }
    }
    
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AddTrackTitleCell.self)
        tableView.register(AddTrackFieldsCell.self)
        tableView.register(TrackImageCell.self)
    }
    
    
}
