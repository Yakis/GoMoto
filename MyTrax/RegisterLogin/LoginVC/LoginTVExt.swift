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
        case 0:
            let headerCell = tableView.dequeueReusableCell(forIndexPath: indexPath) as LoginHeaderCell
            return headerCell
        case 1:
            let loginCell = tableView.dequeueReusableCell(forIndexPath: indexPath) as LoginCell
            loginCell.loginDelegate = self
            return loginCell
        default:
            return UITableViewCell()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 240
        case 1:
            return 180
        default:
            return 240
        }
    }
    
    
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LoginCell.self)
        tableView.register(LoginHeaderCell.self)
    }
    
    
}
