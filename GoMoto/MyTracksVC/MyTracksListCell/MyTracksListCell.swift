//
//  MyTracksListCell.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 21/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import Kingfisher

class MyTracksListCell: UITableViewCell, NibLoadable, ReusableView {

    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    
    func setupCell(with track: Track) {
        self.trackNameLabel.text = track.name
        self.distanceLabel.text = ""
        let imageUrl = URL(string: track.image)
        self.trackImageView.kf.setImage(with: imageUrl)
    }
    
    
}
