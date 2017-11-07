//
//  TrackListCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 07/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import Kingfisher

class TrackListCell: UITableViewCell, NibLoadable, ReusableView {

    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackDescription: UILabel!
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setupCell(with track: Track) {
        self.trackName.text = track.name
        self.trackDescription.text = "\(track.adress), \(track.postcode)"
        guard let imageUrl = URL(string: track.image) else {return}
        self.trackImage.kf.setImage(with: imageUrl)
    }
    
    
    
}
