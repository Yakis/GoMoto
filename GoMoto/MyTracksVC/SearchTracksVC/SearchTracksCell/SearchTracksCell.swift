//
//  SearchTracksCell.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 21/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import Kingfisher

class SearchTracksCell: UITableViewCell {

    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    func setupCell(with track: Track) {
        self.trackNameLabel.text = track.name
        self.distanceLabel.text = "\(String(describing: track.distance)) miles"
        let imageUrl = URL(fileURLWithPath: track.image)
        self.trackImageView.kf.setImage(with: imageUrl)
    }
    
}
