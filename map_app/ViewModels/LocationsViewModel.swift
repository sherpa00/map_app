//
//  LocationsViewModel.swift
//  map_app
//
//  Created by Chhewang Sherpa on 15/03/2024.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init() {
        let gotLocations: [Location] = LocationsDataService.locations
        locations = gotLocations
    }
}
