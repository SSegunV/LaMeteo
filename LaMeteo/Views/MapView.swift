//
//  MapView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 19/12/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // Map variables
    @State private var searchResults = [SearchResult]()
    @State var placeAPin = false
    @State private var selectedLocation: SearchResult?
    @State var pinLocation :CLLocationCoordinate2D? = nil
    @State private var isSheetPresented: Bool = true
    
    // Camera settings
    @State private var cameraProsition = MapCameraPosition.automatic
    
    // View configuration 
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                VStack{
                    MapReader{ reader in
                        Map(
                            position: $cameraProsition,
                            interactionModes: .all, 
                            selection: $selectedLocation
                        )
                        {
                            ForEach(searchResults) { result in
                                Marker(coordinate: result.location) {
                                    Image(systemName: "mappin")
                                }
                                .tag(result)
                            }
                            if let pl = pinLocation {
                                Marker("Add Location", coordinate: pl)
                            }
                        }
                        .onChange(of: selectedLocation) {
                            isSheetPresented = selectedLocation == nil
                        }
                        .onChange(of: searchResults) {
                            if let firstResult = searchResults.first, searchResults.count == 1 {
                                selectedLocation = firstResult
                            }
                        }
                        .onTapGesture(perform: { screenCoord in
                            pinLocation = reader.convert(screenCoord, from: .local)
                            placeAPin = false
                        })
                        
                        .mapControls{
                            MapCompass()
                            MapScaleView()
                            MapPitchToggle()
                        }
                        .mapStyle(.standard(elevation: .automatic))
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        SheetView(searchResults: $searchResults)
                    }
                }
            }
        }
    }
}

#Preview {
    MapView()
}
