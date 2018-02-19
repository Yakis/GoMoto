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
    
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentsTableView: UITableView!
    
    @IBOutlet weak var likeButton: UIImageView!
    
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    func setupCell(with post: Post) {
        self.post = post
        contentLabel.text = post.content
        trackNameLabel.text = post.track_name
        dateTimeLabel.text = post.created_at?.shortDate()
        likesCountLabel.text = "Likes [\(post.likes_count)]"
        guard let trackIconUrl = URL(string: post.track_icon) else {return}
        trackIcon.kf.setImage(with: trackIconUrl)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeAction))
        likeButton.addGestureRecognizer(tap)
        likeButton.isUserInteractionEnabled = true
    }
    
    @IBAction func commentsButtonAction(_ sender: Any) {
        
    }


    @objc func likeAction() {
        let like = PostLike(user_id: 1, post_id: post.id!)
        PostLike.likePost(like: like) { (newPost, error) in
            if let newPost = newPost {
                DispatchQueue.main.async {
                    self.likesCountLabel.text = "Likes [\(newPost.likes_count)]"
                }
            } else {
                print("Error like this post")
            }
        }
    }

    
    
}

