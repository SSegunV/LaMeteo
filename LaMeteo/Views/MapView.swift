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
    @State private var isSheet1Presented: Bool = true
    @State var isSheet2Presented: Bool = false
    //@State var newLocation = LocationData.emptyLocation
    @Binding var locations: [LocationData]
    
    
    // Camera settings
    @State private var cameraProsition = MapCameraPosition.automatic
    
    // View configuration 
    var body: some View {
        ZStack {
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
                                isSheet1Presented = selectedLocation == nil
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
                            }
                            .mapStyle(.standard(elevation: .automatic))
                        }
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                if pinLocation != nil {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(Color.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .frame(width: 60, height: 30)
                                        Button("Add") {
                                            isSheet2Presented = true
                                        }
                                    }
                                }
                            }
                        }
                        .sheet(isPresented: $isSheet2Presented) {
                            LocationEditView(pinLocation: $pinLocation, locations: $locations, isSheet2Presented: $isSheet2Presented)
                        }
                        .sheet(isPresented: $isSheet1Presented) {
                            SheetView(searchResults: $searchResults)
                        }
                    }
                    .toolbarBackground(.hidden, for: .navigationBar, .tabBar)
                }
            }
        }
        if isSheet2Presented {
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    MapView(locations: .constant(LocationData.sampleData))
}
