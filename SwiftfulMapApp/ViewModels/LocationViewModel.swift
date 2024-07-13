//
//  LocationViewModel.swift
//  SwiftfulMapApp
//
//  Created by 胡瑞兴 on 2024/7/7.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    /// All  loaded locations
    @Published var locations: [Location]
    
    /// Current location on map
    @Published var mapLocation: Location{
        // -@MARK diset 在变量变化时它都跟着一起执行
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion = MapCameraPosition.region(MKCoordinateRegion())
    
    let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init(){
        self.locations = LocationsDataService.locations
        
        self.mapLocation = LocationsDataService.locations.first!
        
        self.updateMapRegion(location: mapLocation)
        
    }
    
    private func updateMapRegion(location: Location){
        mapRegion =  MapCameraPosition.region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        
    }
    
}
