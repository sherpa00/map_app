//
//  LocationsViewModel.swift
//  map_app
//
//  Created by Chhewang Sherpa on 15/03/2024.
//

import Foundation
import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    @Published var mapLocation: Location {
        didSet {
            updateMapPosition(location: mapLocation)
        }
    }
    
    @Published var mapPosition: MapCameraPosition
    
    @Published var showLocationsList: Bool = false
    
    private var mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let gotLocations: [Location] = LocationsDataService.locations
        self.locations = gotLocations
        self.mapLocation = gotLocations.first!
        
        self.mapPosition = MapCameraPosition.region(
            MKCoordinateRegion(
                center: gotLocations.first!.coordinates,
                span:  mapSpan
            )
        )
        
        self.updateMapPosition(location: gotLocations.first!)
    }
    
    private func updateMapPosition(location: Location) {
        withAnimation(.easeInOut) {
            mapPosition = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: mapSpan
                )
            )
        }
    }
    
    func toggleShowLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
}

