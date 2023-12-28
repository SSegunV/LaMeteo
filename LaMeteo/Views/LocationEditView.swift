//
//  LocationEditView.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 21/12/2023.
//

import SwiftUI
import MapKit

struct LocationEditView: View {
    
    @Binding var pinLocation : CLLocationCoordinate2D?
    @Binding var locations: [LocationData]
    @State private var newLocation = LocationData.emptyLocation
    @Binding var isSheet2Presented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    isSheet2Presented = false
                }
                .padding()
                Spacer()
                Button("Confirm") {
                    newLocation.coord.lat = pinLocation.unsafelyUnwrapped.latitude
                    newLocation.coord.lon = pinLocation.unsafelyUnwrapped.longitude
                    locations.append(newLocation)
                    isSheet2Presented = false
                }
                .padding()
            }
            Spacer()
            //.padding()
            TextField("Name", text: $newLocation.place)
                .padding()
            Spacer()
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.white)
        .cornerRadius(10)
        .frame(width: UIScreen.main.bounds.width * 6/7, height: UIScreen.main.bounds.height * 1 / 2)
        .padding()
    }
}

#Preview {
    LocationEditView(pinLocation: .constant(CLLocationCoordinate2D(latitude: 50.00, longitude: 50.00)), locations: .constant(LocationData.sampleData), isSheet2Presented: .constant(true))
}
