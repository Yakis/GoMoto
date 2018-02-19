//
//  OwnerTrackListCell.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 19/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import Kingfisher


class OwnerTrackListCell: UITableViewCell, NibLoadable, ReusableView {

    
    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackIconImageView: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    func setupCell(with track: Track) {
        self.trackNameLabel.text = track.name
        if let imageUrl = URL(string: track.image) {
        self.trackIconImageView.kf.setImage(with: imageUrl)
        }
    }
    
}
