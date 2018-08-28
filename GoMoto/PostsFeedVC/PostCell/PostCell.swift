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
        trackNameLabel.text = post.trackName
        dateTimeLabel.text = post.createdAt?.shortDate()
        likesCountLabel.text = "Likes [\(post.likesCount)]"
        guard let trackIconUrl = URL(string: post.trackIcon) else {return}
        trackIcon.kf.setImage(with: trackIconUrl)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeAction))
        likeButton.addGestureRecognizer(tap)
        likeButton.isUserInteractionEnabled = true
    }
    
    @IBAction func commentsButtonAction(_ sender: Any) {
        
    }


    @objc func likeAction() {
        guard let userId = UserDefaults.standard.value(forKey: "uid") as? String else {return}
        let like = PostLike(id: nil, userId: userId, postId: post.id!)
        print("LIKE ========== \(like)")
        PostLike.likePost(like: like) { (newPost, error) in
            if let newPost = newPost {
                DispatchQueue.main.async {
                    self.likesCountLabel.text = "Likes [\(newPost.likesCount)]"
                }
            } else {
                print("Error like this post")
            }
        }
    }

    
    
}

