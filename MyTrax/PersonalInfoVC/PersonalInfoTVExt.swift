//
//  PersonalInfoTVExt.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 30/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit


extension PersonalInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as InfoLogoCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as PersonalInfoCell
            cell.delegate = self
            cell.setupCell(with: self.user)
            return cell
        default: return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150
        case 1:
            return 200
        default:
            return 300
        }
    }
    
    
    
    func setupTableView() {
        tableView.register(PersonalInfoCell.self)
        tableView.register(InfoLogoCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}
