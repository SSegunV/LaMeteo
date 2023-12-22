//
//  LocationsView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 18/12/2023.
//

import SwiftUI

// List of views

struct LocationsView: View {
    
    @Binding var locations: [LocationData]
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void

    var body: some View {
            NavigationView {
                VStack {
                    List {
                        ForEach($locations) { $location in
                            NavigationLink(destination: WeatherView(location: $location)) {
                                CardView(location: $location)
                            }
                        }
                        NavigationLink(destination: MapView(locations: $locations)) {
                            Text("Add Location")
                                .font(.headline)
                                .padding()
                        }
                    }
                }
            }
            .onChange(of: scenePhase) {
                if scenePhase == .inactive {saveAction()}}
        }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(locations: .constant((LocationData.sampleData)), saveAction: {})
    }
}
