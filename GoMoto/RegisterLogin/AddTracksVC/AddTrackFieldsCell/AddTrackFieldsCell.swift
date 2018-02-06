//
//  AddTrackFieldsCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 01/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import MapKit
import Firebase

protocol LocateTrackDelegate: class {
    func showMapView()
}

protocol AdminVCDelegate: class {
    func showAdminVC(for user: TraxUser, with track: Track)
}

class AddTrackFieldsCell: UITableViewCell, NibLoadable, ReusableView {
    
    
    
    @IBOutlet weak var trackNameField: UITextField!
    
    @IBOutlet weak var trackAdressField: UITextField!
    
    @IBOutlet weak var trackPostcodeField: UITextField!
    
    @IBOutlet weak var trackSoilField: UITextField!
    
    @IBOutlet weak var trackOpeningField: UITextField!
    
    @IBOutlet weak var trackPricesField: UITextField!
    
    @IBOutlet weak var createButtonOutlet: UIButton!
    
    @IBOutlet weak var childFriendlySwitch: UISwitch!
    
    
    weak var delegate: LocateTrackDelegate?
    weak var adminDelegate: AdminVCDelegate?
    
    var latitude: String?
    var longitude: String?
    var childFriendly: Bool = false
    var user: TraxUser!
    var trackProfileImageUrl: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createButtonOutlet.roundCorners()
        addObserverForImageUrl()
    }

    
    func setupCell(with user: TraxUser) {
        self.user = user
        trackNameField.text = user.username
    }
    
    
    func imageUrlIsReady(imageUrl: String) {
        self.trackProfileImageUrl = imageUrl
    }
    
    
    
    @IBAction func childFriendlyAction(_ sender: UISwitch) {
        self.childFriendly = sender.isOn
    }
    
    
    
    @IBAction func createButtonAction(_ sender: Any) {
        guard let name = self.trackNameField.text else {return}
        guard let adress = self.trackAdressField.text else {return}
        guard let postcode = self.trackPostcodeField.text else {return}
        guard let latitude = self.latitude?.toDouble() else {return}
        guard let longitude = self.longitude?.toDouble() else {return}
        guard let soil_type = self.trackSoilField.text else {return}
        guard let opening_times = self.trackOpeningField.text else {return}
        guard let prices = self.trackPricesField.text else {return}
        let child_friendly = self.childFriendly
        let user_id = user.id
        let track = Track(name: name, adress: adress, postcode: postcode, latitude: latitude, longitude: longitude, soil_type: soil_type, opening_times: opening_times, prices: prices, child_friendly: child_friendly, rating: 0.0, user_id: user_id, featured: 0, image: trackProfileImageUrl)
        Track.saveTrack(track: track) { [weak self] (track, error) in
            guard let track = track else {return}
            guard let user = self?.user else {return}
            self?.showAdminVC(for: user, with: track)
        }
    }
    
    
    func showAdminVC(for user: TraxUser, with track: Track) {
        DispatchQueue.main.async {
            self.adminDelegate?.showAdminVC(for: user, with: track)
        }
        
    }
    
    
    @IBAction func localizationButtonAction(_ sender: Any) {
        delegate?.showMapView()
        addObserverForAdress()
    }
    
    func addObserverForAdress() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(AddTrackFieldsCell.getAdress(notification:)), name: Notification.Name.adressIsReady, object: nil)
    }
    
    func addObserverForImageUrl() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(AddTrackFieldsCell.getImageUrl(notification:)), name: Notification.Name.imageUrlIsReady, object: nil)
    }
    
    
    @objc func getAdress(notification: Notification) {
        guard let userInfo = notification.userInfo else {return}
        self.trackAdressField.text = userInfo["adress"] as? String
        self.trackPostcodeField.text = userInfo["postcode"] as? String
        self.latitude = userInfo["latitude"] as? String
        self.longitude = userInfo["longitude"] as? String
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: Notification.Name.adressIsReady, object: nil)
    }
    
    
    @objc func getImageUrl(notification: Notification) {
    guard let userInfo = notification.userInfo else {return}
        self.trackProfileImageUrl = userInfo["imageUrl"] as? String
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: Notification.Name.imageUrlIsReady, object: nil)
    }
    
}
