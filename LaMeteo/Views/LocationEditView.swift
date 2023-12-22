//
//  LocationEditView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 21/12/2023.
//

import SwiftUI
import MapKit

struct LocationEditView: View {
    
    @Binding var pinLocation : CLLocationCoordinate2D?
    @Binding var locations: [LocationData]
    @Binding var location: LocationData
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
                    location.coord.lat = pinLocation.unsafelyUnwrapped.latitude
                    location.coord.lon = pinLocation.unsafelyUnwrapped.longitude
                    locations.append(location)
                    isSheet2Presented = false
                }
                .padding()
            }
            Spacer()
            //.padding()
            TextField("Name", text: $location.place)
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
    LocationEditView(pinLocation: .constant(CLLocationCoordinate2D(latitude: 50.00, longitude: 50.00)), locations: .constant(LocationData.sampleData), location: .constant(LocationData.emptyLocation), isSheet2Presented: .constant(true))
}
