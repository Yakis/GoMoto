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
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Search action here
        guard let postcode = searchBar.text else {return}
        getLocation(from: postcode) { (coordinates, error) in
            print(coordinates)
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
    
    
    
    
    
}
