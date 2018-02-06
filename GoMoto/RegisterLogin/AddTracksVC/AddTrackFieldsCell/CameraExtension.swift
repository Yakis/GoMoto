//
//  CameraExtension.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 05/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

extension AddTracksVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func openCameraVC() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            openPhotoLibrary()
        }
    }
    
    
    func openPhotoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        trackProfileImageView.image = image
        dismiss(animated:true, completion: nil)
    }
    
    
    
    
}
