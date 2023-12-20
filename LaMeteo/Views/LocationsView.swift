//
//  LocationsView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 18/12/2023.
//

import SwiftUI

// List of views

struct LocationsView: View {
    var locations: [WeatherData]
    var body: some View {

        // List
        List(locations) { location in
            CardView(current_weather: location)}
        
        // Navigation Link that takes you to map
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(locations: WeatherData.sampleData)
    }
}
