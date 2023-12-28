//
//  LocationsView.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 18/12/2023.
//

import SwiftUI

// List of views

struct LocationsView: View {
    
    @Binding var locations: [LocationData]
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void

    var body: some View {
            NavigationStack {
                VStack {
                    List {
                        ForEach($locations) { $location in
                            NavigationLink(destination: WeatherView(locations: $locations)) {
                                CardView(location: $location)
                            }
                        }
                        .onDelete { indices in
                            locations.remove(atOffsets: indices)}
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
