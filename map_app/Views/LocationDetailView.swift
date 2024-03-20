//
//  LocationDetailView.swift
//  map_app
//
//  Created by Chhewang Sherpa on 20/03/2024.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                
                titleSection
                Divider()
                descriptionSection
                Divider()
                mapLayer
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(
            backButton,
            alignment: .topTrailing
        )
    }
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(.page)
        .shadow(color: Color.black.opacity(0.3),radius: 20, x: 0, y: 10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if let url = URL(string: location.link) {
                Link("Read More on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private var mapLayer: some View {
        Map(
            initialPosition: MapCameraPosition.region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span:  MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                )
            )
        ) {
            Annotation(location.name, coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 30.0))
    }
    
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.title)
                .foregroundStyle(.primary)
                .padding(16)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .shadow(radius: 10)
                .padding()
        }
    }
}
#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}
