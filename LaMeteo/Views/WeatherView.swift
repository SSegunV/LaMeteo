//
//  ContentView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 02/12/2023.
//

import SwiftUI
import Charts


struct WeatherView: View {
    
    @State private var current_weather = WeatherData.sampleData[2]
    @State var forecast: ForecastData = ForecastData.sampleData
    @Binding var locations: [LocationData]
    
    var body: some View {
        ZStack {
            TabView {
                ForEach($locations) { $location in
                    ContentView(location: $location)
                        .tag(location.id)
                    }
                }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            }
        }
    }

#Preview {
    WeatherView(locations: .constant(LocationData.sampleData))
}
