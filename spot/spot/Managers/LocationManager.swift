//
//  LocationManager.swift
//  spot
//
//  Created by Lindsay Kaufman on 12/02/23.
//

import Foundation
import SwiftUI
import MapKit
import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    static let shared = LocationManager()
    
    private let locationManager: CLLocationManager
    
    @Published var currentLocation: CLLocation?
    @Published var region: MKCoordinateRegion?
 
    var location: CLLocation? = nil
    
    
     override init() {
        self.locationManager = CLLocationManager()
       super.init()
       self.locationManager.delegate = self
       self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//       self.locationManager.requestWhenInUseAuthorization()
//       self.locationManager.startUpdatingLocation()
    }
    
    func requestAuth() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        self.currentLocation = newLocation
        
        // Update the map's region to center on the user's location
        self.region = MKCoordinateRegion(center: newLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
    
    func startUpdatingLocation() {
        self.locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        self.locationManager.stopUpdatingLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
        locationManager.startUpdatingLocation()
    }
}
