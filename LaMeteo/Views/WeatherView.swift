//
//  ContentView.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 02/12/2023.
//

import SwiftUI
import Charts


struct WeatherView: View {
    
    @State private var current_weather = WeatherData.sampleData[2]
    @State var forecast: ForecastData = ForecastData.sampleData
    @Binding var locations: [LocationData]
    
    // View simply displays weather reports for
    // User locations in a list
    var body: some View {
            TabView {
                ForEach($locations) { $location in
                    ContentView(location: $location, bg: Image("Page5"), fbg: Image("Night"), fg: .black)
                        .tag(location.id)
                    }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: EmptyView()) // Hides the default back button
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    NavigationLink(destination: LocationsView(locations: $locations, saveAction: {})) {
                        Image(systemName: "list.bullet")
                    }
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar, .tabBar)
            .ignoresSafeArea()
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        }
    }

#Preview {
    WeatherView(locations: .constant(LocationData.sampleData))
}
 
