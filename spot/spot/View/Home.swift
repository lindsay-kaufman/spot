//
//  Home.swift
//  spot
//
//  Created by Lindsay Kaufman on 12/1/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            SpotMapView(locationManager: locationManager)
        }.onAppear {
            locationManager.requestAuth()
        }
    
    }
}

struct Profile_Preview: PreviewProvider {
    static var previews: some View {
        Home().padding()
    }
}
