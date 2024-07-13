//
//  LocationVIew.swift
//  SwiftfulMapApp
//
//  Created by 胡瑞兴 on 2024/7/7.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    //    @State private var mapRegion = MapCameraPosition.region(MKCoordinateRegion(
    //        center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
    //        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    //    ))
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapRegion)
            
            VStack(spacing: 0){
                header
                    .padding()
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
extension LocationsView {
    private var header: some View{
        VStack {
            Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundStyle(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .padding()
                }
            LocationsListView()
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
