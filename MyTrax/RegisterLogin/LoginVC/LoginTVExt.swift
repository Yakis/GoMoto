//
//  LoginTVExt.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 14/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit


extension LoginVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 1:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as LoginCell
            cell.loginDelegate = self
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1:
            return 180
        default:
            return 50
        }
    }
    
    
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LoginCell.self)
    }
    
    
}
