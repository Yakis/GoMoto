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
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as InfoLogoCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as PersonalInfoCell
            cell.setupCell(with: self.user)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150
        default:
            return 200
        }
        return 200
    }
    
    
    
    func setupTableView() {
        tableView.register(PersonalInfoCell.self)
        tableView.register(InfoLogoCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}
