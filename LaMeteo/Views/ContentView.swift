//
//  WeatherContentView.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 22/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var current_weather = WeatherData.sampleData[2]
    @Binding var location: LocationData
    @State var forecast: ForecastData = ForecastData.sampleData
    @State var bg : Image
    @State var fbg: Image
    
    var body: some View {
        
        ZStack {
            fbg
                .resizable()
                .scaledToFill()
            bg
                .resizable()
                .scaledToFill()
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
                        print("Forecast fetch success")
                    } catch {
                        print("Error fetching forecast")
                    }
                    
                    do {
                        current_weather = try await fetchWeather(lon: location.coord.lon!, lat: location.coord.lat!)
                        print("Weather fetch success")
                    } catch {
                        print("Error fetching weather")
                    }
                    do {
                        bg = backgroundForWeather(current_weather)
                    }
                    do {
                        fbg = backgroundForTimeOfDay(forecast.list![0].dtTxt)
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView(location: .constant(LocationData.sampleData[0]), bg: Image("Page5"), fbg: Image("Night"))
}
