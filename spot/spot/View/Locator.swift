//
//  Locator.swift
//  spot
//
//  Created by Lindsay Kaufman on 12/1/23.
//

import SwiftUI
import MapKit

struct Locator: View {
    var body: some View {
        HStack {
            Search().padding()
        }
    }
}

struct Search: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var search: String = ""
    //var mapView = SpotMapView(locationManager: locationManager)
    var body: some View {
        ZStack {
            TextField("Search", text: $search, onEditingChanged: { _ in })
            .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
        }
    }
}

struct Arrow: View {
    var body: some View {
        Image("arrow")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 30)
    }
}

struct Locator_Preview: PreviewProvider {
    static var previews: some View {
        HStack {
            Search().padding()
        }
        
    }
}
