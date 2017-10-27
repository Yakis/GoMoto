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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as LogoCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as EmailRegistrationCell
            return cell
        default:
            return UITableViewCell()

        }
//        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as EmailRegistrationCell
//        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 150
        case 1:
            return 200
        default:
            return 50
            
        }
    }
    
    
}
