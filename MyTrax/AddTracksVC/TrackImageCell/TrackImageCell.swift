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
    
    
    
    weak var delegate: AddImageDelegate?
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
        uploadTask.observe(.progress) { [weak self] snapshot in
            let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount)
                / Double(snapshot.progress!.totalUnitCount)
            DispatchQueue.main.async {
                self?.progresView.progress = Float(percentComplete)
            }
        }
        uploadTask.observe(.success) { (snapshot) in
            guard let metadata = snapshot.metadata else {return}
            guard let url = metadata.downloadURL() else {return}
            uploadTask.removeAllObservers(for: .progress)
            DispatchQueue.main.async {
                self.trackProfileImageView.kf.setImage(with: url)
                self.trackProfileImageView.contentMode = .scaleAspectFill
                self.trackProfileImageView.clipsToBounds = true
            }
            
        }
        
        
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
        self.delegate?.addTrackImage()
    }
    
    
}
