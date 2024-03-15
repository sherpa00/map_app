//
//  LocationsView.swift
//  map_app
//
//  Created by Chhewang Sherpa on 15/03/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapPosition)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
