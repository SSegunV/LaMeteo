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
    @Binding var location: LocationData
    @State var forecast: ForecastData = ForecastData.sampleData
    
    var body: some View {
        ZStack {
            VStack {
                // Weather Box
                WeatherBoxView(location: $location, current_weather: $current_weather)
                
                // Hour Forecast
                ForecastBarView(forecast: $forecast)
                
                // Additional data
                AdditionalMetricsView(current_weather: $current_weather)
            }
            // fetch forecast
            .onAppear {
                Task {
                    do {
                        forecast = try await fetchForecast(lon: location.coord.lon!, lat: location.coord.lat!)
                        print("success")
                    } catch {
                        print(error)
                    }
                }
            }

            // fetch weather
            .onAppear {
                Task {
                    do {
                        current_weather = try await fetchWeather(lon: location.coord.lon!, lat: location.coord.lat!)
                        print("success")
                    } catch {
                        print(error)
                    }
                }
            }
        }
        //.toolbar {
            //ToolbarItem(placement: .topBarTrailing) {
               // NavigationLink(destination: LocationsView(locations: locations)) {
                  //  Text("")
               // }
            //}
        //}
    }
}

#Preview {
    WeatherView(location: .constant(LocationData.sampleData[0]))
}
