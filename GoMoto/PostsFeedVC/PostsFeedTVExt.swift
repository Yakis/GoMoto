//
//  PostsFeedTVExt.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 11/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


extension PostsFeedVC: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as PostCell
        cell.setupCell(with: posts[indexPath.row])
        return cell
    }
    
    
    
    
    func setupTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostCell.self)
    }
    
    
    
}
