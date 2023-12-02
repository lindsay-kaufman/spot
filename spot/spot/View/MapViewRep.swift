//
//  MapViewRep.swift
//  spot
//
//  Created by Lindsay Kaufman on 12/1/23.
//

import SwiftUI
import MapKit
import CoreLocation
import UIKit
import MapKit

struct SpotMapView: UIViewControllerRepresentable {
//    let coordinates: [CLLocationCoordinate2D]
    @ObservedObject var locationManager: LocationManager
    
    func makeUIViewController(context: Context) -> UIViewController {
        let mapView = MKMapView()
         let viewController = UIViewController()
         mapView.delegate = context.coordinator
         mapView.showsUserLocation = true
         mapView.userTrackingMode = .follow
        
        // TODO: Paint coordinates on the map
//         mapView.addAnnotation(MKPointAnnotation(__coordinate: coordinate))
         viewController.view = mapView
         return viewController
     }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
           // Update the view controller if needed
       }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self, locationManager: locationManager)
     }



}

class Coordinator: NSObject, CLLocationManagerDelegate, MKMapViewDelegate {
    var parent: SpotMapView
    var locationManager = LocationManager.shared

    init(parent: SpotMapView, locationManager: LocationManager) {
        self.parent = parent
        self.locationManager = locationManager
    }

    // Implement the necessary CLLocationManagerDelegate and MKMapViewDelegate methods here
    // updated view
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool){
         
     }
}
    

extension SpotMapView {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: SpotMapView
        
        init(parent: SpotMapView) {
            self.parent = parent
            super.init()
        }
    }
}

