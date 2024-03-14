//
//  Location.swift
//  map_app
//
//  Created by Chhewang Sherpa on 13/03/2024.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + cityName
    }
}
