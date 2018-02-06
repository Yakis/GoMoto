//
//  AditionalInfoTVExt.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 06/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

extension AditionalInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as AditionalInfoCell
            cell.setupCell(with: user)
            cell.usernameDelegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 400
        default:
            return 150
        }
    }
    
    
    func setupTableVIew() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AditionalInfoCell.self)
    }
    
    
}
