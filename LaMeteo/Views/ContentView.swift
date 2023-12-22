//
//  WeatherContentView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 22/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var current_weather = WeatherData.sampleData[2]
    @Binding var location: LocationData
    @State var forecast: ForecastData = ForecastData.sampleData
    
    var body: some View {
        
            VStack {
                WeatherBoxView(location: $location, current_weather: $current_weather)
                ForecastBarView(forecast: $forecast)
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
}

#Preview {
    ContentView(location: .constant(LocationData.sampleData[0]))
}
