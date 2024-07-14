//
//  LocationsListView.swift
//  SwiftfulMapApp
//
//  Created by 胡瑞兴 on 2024/7/12.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button(action: {
                    vm.showNextLocation(location: location)
                }, label: {
                    listRawView(location: location)
                })
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}

extension LocationsListView{
    
    private func listRawView(location: Location) -> some View {
        HStack{
            if let imageNmae = location.imageNames.first{
                Image(imageNmae)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
