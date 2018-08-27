//
//  SearchTracksCell.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 21/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import Kingfisher

class SearchTracksCell: UITableViewCell, NibLoadable, ReusableView {

    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    
    var track: Track!
    var isFavorite: Bool = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        favoriteButtonOutlet.setImage(#imageLiteral(resourceName: "FavoriteTrackIconEmpty"), for: .normal)
    }
    
    
    func setupCell(with track: Track, favoritesIds: [Int]) {
        self.track = track
        self.trackNameLabel.text = track.name
        self.distanceLabel.text = ""
        if favoritesIds.contains(track.id!) {
            isFavorite = true
            favoriteButtonOutlet.setImage(#imageLiteral(resourceName: "FavoriteTrackIconFull"), for: .normal)
        }
        let imageUrl = URL(string: track.image)
        self.trackImageView.kf.setImage(with: imageUrl)
        guard let distance = track.distance else {return}
        let roundDistance = round(distance)
        self.distanceLabel.text = "\(String(describing: roundDistance)) miles"
    }
    
    @IBAction func setFavorite(_ sender: Any) {
        guard let trackId = track.id else {return}
        switch isFavorite {
        case true:
            isFavorite = false
            removeTrackFromFavorites(trackId: trackId)
            favoriteButtonOutlet.setImage(#imageLiteral(resourceName: "FavoriteTrackIconEmpty"), for: .normal)
        default:
            isFavorite = true
            favoriteButtonOutlet.setImage(#imageLiteral(resourceName: "FavoriteTrackIconFull"), for: .normal)
            saveTrackAsFavorite(trackId: trackId)
        }
    }
    
    
    func saveTrackAsFavorite(trackId: Int) {
        guard let userId = UserDefaults.standard.value(forKey: "userId") as? Int else {return}
        let favorite = FavoriteTrack(userId: userId, trackId: trackId)
        FavoriteTrack.setFavorite(favorite: favorite) { (track, error) in
            print(track?.favoritesCount ?? "There's no tracks!")
        }
    }
    
    
    func removeTrackFromFavorites(trackId: Int) {
        guard let userId = UserDefaults.standard.value(forKey: "userId") as? Int else {return}
        let favorite = FavoriteTrack(userId: userId, trackId: trackId)
        print("Deleted \(favorite.userId)")
        FavoriteTrack.removeFavorite(favorite: favorite) { (confirmation, error) in
            if error == nil {
                print(confirmation ?? "Track can't be removed!")
            }
        }
    }
    
    
}
