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
        ZStack(alignment: .top) {
            Map(position: $vm.mapPosition)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // current map location name
                header
            }
            
        }
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleShowLocationsList) {
                Text(vm.mapLocation.name + " " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading, content: {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .padding()
                            .foregroundStyle(.primary)
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    })
            }
            .foregroundStyle(.primary)
            
            // locations list
            if (vm.showLocationsList) {
                LocationsListView()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .background(.thickMaterial)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        .padding()
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
