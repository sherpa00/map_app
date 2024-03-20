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
    
    let maxIpadWidth: CGFloat? = 700
    
    var body: some View {
        ZStack(alignment: .top) {
            mapView
                
                
            VStack(spacing: 0) {
                header
                    .frame(maxWidth: maxIpadWidth)
                
                Spacer()
                
                locationPreview
                    .frame(maxWidth: maxIpadWidth)
                    .frame(maxWidth: .infinity)
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) {location in
                LocationDetailView(location: location)
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
    
    private var mapView: some View {
        Map(position: $vm.mapPosition) {
            ForEach(vm.locations) {location in
                Annotation(location.name, coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1.2 : 0.8)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            }
        }
    }
    
    private var locationPreview: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationsPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.4), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
