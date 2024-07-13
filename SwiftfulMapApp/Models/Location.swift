//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by 胡瑞兴 on 2024/7/7.
//

import Foundation
import MapKit

struct Location : Identifiable{
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    var id: String{
        name + cityName
    }
    
}


 
