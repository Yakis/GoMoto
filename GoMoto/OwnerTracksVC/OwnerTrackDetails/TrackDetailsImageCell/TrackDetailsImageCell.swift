//
//  TrackDetailsImageCell.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 19/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class TrackDetailsImageCell: UITableViewCell, NibLoadable, ReusableView {

    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var changeTrackImage: UIImageView!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    func setupCell(with track: Track) {
        trackNameLabel.text = track.name
    }
    
}
