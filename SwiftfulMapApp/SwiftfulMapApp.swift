//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by 胡瑞兴 on 2024/7/7.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    @StateObject private var vm: LocationsViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
