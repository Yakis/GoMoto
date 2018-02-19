//
//  LocateTrackVC.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 01/11/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class LocateTrackVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var doneButtonOutlet: UIButton!
    
    let locationManager = CLLocationManager()
    let annotation = MKPointAnnotation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButtonOutlet.roundCorners()
        setupMapView()
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleTap(gestureReconizer:)))
        gestureRecognizer.minimumPressDuration = 0.5
        gestureRecognizer.delegate = self
        mapView.addGestureRecognizer(gestureRecognizer)
    }

    func setupMapView() {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return MKAnnotationView(annotation: self.annotation, reuseIdentifier: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Errors " + error.localizedDescription)
    }
    
    
    @objc func handleTap(gestureReconizer: UILongPressGestureRecognizer) {
        let location = gestureReconizer.location(in: mapView)
        let coordinate = mapView.convert(location,toCoordinateFrom: mapView)
        // Must get location information here to fill the fields
        // Add annotation:
        annotation.coordinate = coordinate
        let geocoder = CLGeocoder()
        let loca = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        geocoder.reverseGeocodeLocation(loca) { (placemarks, error) in
            guard let placemarks = placemarks else {return}
            let placemark = placemarks[0]
            guard let dictionary = placemark.addressDictionary else {return}
            guard let postcode = dictionary["ZIP"] else {return}
            guard let street = dictionary["Street"] else {return}
            guard let city = dictionary["City"] else {return}
            let notificationCenter = NotificationCenter.default
            let dict = ["adress": "\(street), \(city)", "postcode": "\(postcode)", "latitude": "\(coordinate.latitude)", "longitude": "\(coordinate.longitude)"]
            notificationCenter.post(name: .adressIsReady, object: nil, userInfo: dict)
        }
        mapView.addAnnotation(annotation)
    }
    
    
    
    @IBAction func doneButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    

}
