//
//  PostCell.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 11/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import Kingfisher

class PostCell: UITableViewCell, NibLoadable, ReusableView {

    
    @IBOutlet weak var trackIcon: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var commentsButtonLabel: UIButton!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    @IBOutlet weak var commentsTableView: UITableView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    func setupCell(with post: Post) {
        contentLabel.text = post.content
        trackNameLabel.text = post.track_name
        dateTimeLabel.text = post.created_at.shortDate()
        guard let trackIconUrl = URL(string: post.track_icon) else {return}
        trackIcon.kf.setImage(with: trackIconUrl)
        
    }
    
    @IBAction func commentsButtonAction(_ sender: Any) {
        
    }



}

