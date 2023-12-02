//
//  spotApp.swift
//  spot
//
//  Created by Lindsay Kaufman on 12/1/23.
//

import SwiftUI


@main
struct spotApp: App {
    @StateObject private var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            Home().padding(.horizontal, 8.0)
                .environmentObject(locationManager)
        }
    }
}

