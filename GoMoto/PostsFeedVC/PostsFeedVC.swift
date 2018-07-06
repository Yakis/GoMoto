//
//  PostsFeedVC.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 11/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class PostsFeedVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var posts: [Post] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getAllPosts()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
    }

   
    
    
    func getAllPosts() {
        Post.getAllPosts { [weak self] (posts, error) in
            guard let posts = posts else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            self?.posts = posts
        }
    }
    


}
