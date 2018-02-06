//
//  TrackImageCell.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 05/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import FirebaseStorage
import Kingfisher


protocol AddImageDelegate: class {
    func addTrackImage()
}


class TrackImageCell: UITableViewCell, ReusableView, NibLoadable, TrackImagePickerDelegate {
    
    
    @IBOutlet weak var trackProfileImageView: UIImageView!
    @IBOutlet weak var progresView: UIProgressView!
    
    weak var addImageDelegate: AddImageDelegate?
    let storage = Storage.storage()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTapGesture()
        
    }

    
    func setImageReadyDelegate(addTracksVC: AddTracksVC) {
        addTracksVC.delegate = self
    }
    
    
    func imageIsReady(image: UIImage, trackName: String) {
        let path = "/trackProfile/\(trackName).jpg"
        let storageRef = storage.reference(withPath: path)
        guard let imageData = getData(from: image) else {return}
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        let uploadTask = storageRef.putData(imageData, metadata: metadata)
        self.trackProfileImageView.image = nil
        ActivityIndicatorManager.shared.showActivityIndicator(on: self, interactionEnabled: true)
        uploadTask.observe(.progress) { [weak self] snapshot in
            let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount)
                / Double(snapshot.progress!.totalUnitCount)
            DispatchQueue.main.async {
                self?.progresView.progress = Float(percentComplete)
            }
        }
        uploadTask.observe(.success) { [ weak self ] (snapshot) in
            guard let metadata = snapshot.metadata else {return}
            guard let url = metadata.downloadURL() else {return}
            self?.postNotificationWhenImageUrlIsReady(imageUrl: url.absoluteString)
            uploadTask.removeAllObservers(for: .progress)
            DispatchQueue.main.async {
                self?.trackProfileImageView.kf.setImage(with: url)
                ActivityIndicatorManager.shared.stopActivityIndicator()
                self?.trackProfileImageView.contentMode = .scaleAspectFill
                self?.trackProfileImageView.clipsToBounds = true
                self?.progresView.progress = 0.0
            }
            
        }
        
        
    }
    
    
    func postNotificationWhenImageUrlIsReady (imageUrl: String) {
        let notificationCenter = NotificationCenter.default
        let dict = ["imageUrl": "\(imageUrl)"]
        notificationCenter.post(name: .imageUrlIsReady, object: nil, userInfo: dict)
    }
    
    func getData(from image: UIImage) -> Data? {
        guard let data = UIImageJPEGRepresentation(image, 0.7) else {return nil}
        return data
    }
    
    
    func addTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TrackImageCell.addImageAction(_:)))
        trackProfileImageView.isUserInteractionEnabled = true
        trackProfileImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func addImageAction(_ sender: Any) {
        self.addImageDelegate?.addTrackImage()
    }
    
    
}
