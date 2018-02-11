//
//  PostCell.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 11/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell, NibLoadable, ReusableView {

    
    @IBOutlet weak var contentLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    func setupCell(with post: Post) {
        contentLabel.text = post.content
    }
    
}
