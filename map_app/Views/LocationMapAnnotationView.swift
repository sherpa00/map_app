//
//  LocationMapAnnotationView.swift
//  map_app
//
//  Created by Chhewang Sherpa on 19/03/2024.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor: Color = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "mappin.and.ellipse.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .font(.headline)
                .foregroundStyle(accentColor)
                .background(.white)
                .clipShape(Circle())
                
            
            Image(systemName: "arrowtriangle.down.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .font(.headline)
                .foregroundStyle(accentColor)
                .offset(y: -4)
        }
    }
}

#Preview {
    LocationMapAnnotationView()
}
