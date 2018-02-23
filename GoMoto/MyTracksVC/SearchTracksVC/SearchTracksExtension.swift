//
//  SearchTracksExtension.swift
//  GoMoto
//
//  Created by Mugurel Moscaliuc on 21/02/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension SearchTracksVC: UISearchBarDelegate {
    
    // 51.531955, 0.725454
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Search action here
        guard let postcode = searchBar.text else {return}
        getLocation(from: postcode) { [weak self] (coordinates, error) in
            self?.userLocation = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
            self?.sortTracks(userLocation: (self?.userLocation)!)
        }
        searchBar.endEditing(true)
        searchBar.resignFirstResponder()
    }
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(searchBar.text)
    }
    
    
    func getLocation(from postcode: String, completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(postcode) { (placemarks, error) in
                if error == nil {
                    if let placemark = placemarks?[0] {
                        let location = placemark.location!
                        
                        completionHandler(location.coordinate, nil)
                        return
                    }
                }
                completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
            }
        }
    
    
    func getDistanceBetweenLocations(firstLocation: CLLocation, secondLocation: CLLocation) -> Double {
        let distance: CLLocationDistance = firstLocation.distance(from: secondLocation)
        return distance.toMiles()
    }
    
    
    
    func sortTracks(userLocation: CLLocation) {
        var withDistance: [Track] = []
        for var track in tracks {
           let trackLocation = CLLocation(latitude: track.latitude, longitude: track.longitude)
            track.distance = getDistanceBetweenLocations(firstLocation: userLocation, secondLocation: trackLocation)
            withDistance.append(track)
        }
        let sorted: [Track] = withDistance.sorted(by: { Double($0.distance!) < Double($1.distance!) })
        self.estimatedTracks = sorted
    }
    
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
}
