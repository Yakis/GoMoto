//
//  TrackImageCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 05/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

protocol AddImageDelegate: class {
    func addTrackImage()
}


class TrackImageCell: UITableViewCell, ReusableView, NibLoadable, TrackImagePickerDelegate {
    
    

    
    
    @IBOutlet weak var trackProfileImageView: UIImageView!
    
    weak var delegate: AddImageDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTapGesture()
        
    }

    
    func setImageReadyDelegate(addTracksVC: AddTracksVC) {
        addTracksVC.delegate = self
    }
    
    
    func imageIsReady(image: UIImage) {
        self.trackProfileImageView.image = image
        self.trackProfileImageView.contentMode = .scaleAspectFill
        self.trackProfileImageView.clipsToBounds = true
    }
    
    
    
    func addTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TrackImageCell.addImageAction(_:)))
        trackProfileImageView.isUserInteractionEnabled = true
        trackProfileImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func addImageAction(_ sender: Any) {
        self.delegate?.addTrackImage()
    }
    
    
}
