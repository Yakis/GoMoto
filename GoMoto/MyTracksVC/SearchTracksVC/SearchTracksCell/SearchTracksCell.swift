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
    
    private let favoriteTracksKey: String = "favoriteTracks"
    private var userDefaults: UserDefaults!
    private var favoritesTracks: [Int] {
        get {
            guard let array = userDefaults.value(forKey: favoriteTracksKey) as? [Int] else {return [Int]()}
            return array
        }
        
        set {
            userDefaults.set(newValue, forKey: favoriteTracksKey)
            userDefaults.synchronize()
        }
    }

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userDefaults = UserDefaults.standard
        print(favoritesTracks)
        // Initialization code
    }

    
    
    func setupCell(with track: Track) {
       // UserDefaults.standard.setValue([], forKey: "favoriteTracks")
        self.track = track
        self.trackNameLabel.text = track.name
        self.distanceLabel.text = ""
        let imageUrl = URL(string: track.image)
        if favoritesTracks.contains(track.id!) {
            isFavorite = true
            favoriteButtonOutlet.setImage(#imageLiteral(resourceName: "FavoriteTrackIconFull"), for: .normal)
        }
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
            removeTrackFromFavorites(id: trackId)
            favoriteButtonOutlet.setImage(#imageLiteral(resourceName: "FavoriteTrackIconEmpty"), for: .normal)
            print(favoritesTracks.count)
        default:
            isFavorite = true
            favoriteButtonOutlet.setImage(#imageLiteral(resourceName: "FavoriteTrackIconFull"), for: .normal)
            saveTrackAsFavorite(id: trackId)
            print(favoritesTracks.count)
        }
    }
    
    
    
    func saveTrackAsFavorite(id: Int) {
        var favorites = favoritesTracks
        favorites.append(id)
        self.favoritesTracks = favorites
        print(self.favoritesTracks)
    }
    
    
    func removeTrackFromFavorites(id: Int) {
        var favorites = self.favoritesTracks
        if let index = favorites.index(of: id) {
            favorites.remove(at: index)
            self.favoritesTracks = favorites
        }
        print(self.favoritesTracks)
    }
    
    
}
