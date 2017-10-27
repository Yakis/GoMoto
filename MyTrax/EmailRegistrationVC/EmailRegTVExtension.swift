//
//  EmailRegTVExtension.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 27/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

extension EmailRegistrationVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.row {
//        case 0: return UITableViewCell()
//        case 1:
//            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as EmailRegistrationCell
//            return cell
//        default:
//            return UITableViewCell()
//
//        }
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as EmailRegistrationCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
