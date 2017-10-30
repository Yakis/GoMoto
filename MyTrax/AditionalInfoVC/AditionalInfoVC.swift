//
//  AditionalInfoVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 30/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import CoreLocation

class AditionalInfoVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var userType: UILabel!
    
    @IBOutlet weak var firebaseUID: UILabel!
    
    @IBOutlet weak var adress: UILabel!
    
    var user: TraxUser!
    var locationManager:CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstName.text = "First Name: \(user.first_name!)"
        self.lastName.text = "Last Name: \(user.last_name!)"
        self.email.text = "Email: \(user.email!)"
        self.phoneNumber.text = "Contact number: \(user.contact_number!)"
        self.userType.text = "User type: \(user.user_type!)"
        self.firebaseUID.text = "Firebase UID: \(user.firebase_uid!)"
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        determineMyCurrentLocation()
    }
    
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
           // locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error) in
            if (error != nil) {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            
            if placemarks?.count != 0 {
                let pm = placemarks![0] as CLPlacemark
                self.displayLocationInfo(placemark: pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
        
        
        let userLocation:CLLocation = locations[0] as CLLocation
        
         manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    

    
    func displayLocationInfo(placemark: CLPlacemark) {
        if placemark != nil {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            guard let locality = placemark.locality else {return}
            guard let postcode = placemark.postalCode else {return}
            guard let administrativeArea = placemark.administrativeArea else {return}
            guard let country = placemark.country else {return}
            self.adress.text = "Adress: \(locality), \(postcode), \(administrativeArea), \(country)"
        }
    }
    

}
