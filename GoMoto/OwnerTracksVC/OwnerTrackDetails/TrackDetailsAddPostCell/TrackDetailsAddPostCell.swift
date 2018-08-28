//
//  TrackDetailsAddPostCell.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 19/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


extension TrackDetailsAddPostCell: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write a post"
            textView.textColor = UIColor.lightGray
        }
    }
    
}

class TrackDetailsAddPostCell: UITableViewCell, NibLoadable, ReusableView {

    
    @IBOutlet weak var newPostTextView: UITextView!
    @IBOutlet weak var postButtonOutlet: UIButton!
    @IBOutlet weak var addPostImage: UIImageView!
    
    var track: Track!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newPostTextView.delegate = self
    }

    func setupCell(with track: Track) {
        self.track = track
        newPostTextView.text = "Write a post"
        newPostTextView.textColor = UIColor.lightGray
        newPostTextView.layer.borderWidth = 0.5
        newPostTextView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    @IBAction func postButtonAction(_ sender: Any) {
        guard let userId = UserDefaults.standard.value(forKey: "uid") as? String else {return}
        let newPost = Post(id: nil, content: newPostTextView.text, image: "", trackId: track.id!, userId: userId, trackName: track.name, trackIcon: track.image, createdAt: nil, updatedAt: nil, likesCount: 0, commentsCount: 0)
        Post.savePost(post: newPost) { (post, error) in
            if let post = post {
                print("Success! \(post.content)")
                DispatchQueue.main.async {
                    self.newPostTextView.resignFirstResponder()
                    self.newPostTextView.endEditing(true)
                }
            }
        }
    }
    
}
